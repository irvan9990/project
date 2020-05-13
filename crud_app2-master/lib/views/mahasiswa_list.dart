import 'package:crud_app2/models/api_response.dart';
import 'package:crud_app2/models/mahasiswa.dart';
import 'package:crud_app2/services/mahasiswas_service.dart';
import 'package:crud_app2/views/mahasiswa_delete.dart';
import 'package:crud_app2/views/mahasiswa_modify.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MahasiswaList extends StatefulWidget {
  @override
  _MahasiswaListState createState() => _MahasiswaListState();
}

class _MahasiswaListState extends State<MahasiswaList> {
  MahasiswasService get service => GetIt.I<MahasiswasService>();

  APIResponse<List<Mahasiswa>> _apiResponseListMahasiswa;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchMahasiswa();
    super.initState();
  }

  _fetchMahasiswa() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponseListMahasiswa = await service.getMahasiswaList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ], title: Text('List Mahasiswa')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => MahasiswaModify()))
                .then((_) {
              _fetchMahasiswa();
            });
          },
          child: Icon(Icons.add),
        ),
        body: Builder(
          builder: (_) {
            if (_isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (_apiResponseListMahasiswa.error) {
              return Center(
                  child: Text(_apiResponseListMahasiswa.errorMessage));
            }

            return ListView.separated(
              separatorBuilder: (_, __) =>
                  Divider(height: 1, color: Colors.green),
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(_apiResponseListMahasiswa.data[index].id),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context, builder: (_) => MahasiswaDelete());

                    if (result) {
                      final deleteResult = await service.deleteMahasiswa(
                          _apiResponseListMahasiswa.data[index].id);
                      var message = '';

                      if (deleteResult != null && deleteResult.data == true) {
                        message = 'Data Mahasiswa berhasil dihapus';
                      } else {
                        message =
                            deleteResult?.errorMessage ?? 'An error occrued';
                      }
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(message),
                          duration: new Duration(milliseconds: 1000)));

                      return deleteResult.data ?? false;
                    }
                    print(result);
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      child: Icon(Icons.delete, color: Colors.white),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      _apiResponseListMahasiswa.data[index].nama,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text(
                      _apiResponseListMahasiswa.data[index].jurusan,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (_) => MahasiswaModify(
                                  id: _apiResponseListMahasiswa
                                      .data[index].id)))
                          .then((data) {
                        _fetchMahasiswa();
                      });
                    },
                  ),
                );
              },
              itemCount: _apiResponseListMahasiswa.data.length,
            );
          },
        ));
  }
}
