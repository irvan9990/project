import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:crud_app2/models/mahasiswa.dart';
import 'package:crud_app2/services/mahasiswas_service.dart';
import 'package:intl/intl.dart';

class MahasiswaModify extends StatefulWidget {
  final String id;
  MahasiswaModify({this.id});

  @override
  _MahasiswaModifyState createState() => _MahasiswaModifyState();
}

class _MahasiswaModifyState extends State<MahasiswaModify> {
  bool get isEditing => widget.id != null;

  MahasiswasService get mahasiswaService => GetIt.I<MahasiswasService>();

  String errorMessage;
  Mahasiswa mahasiswa;

  TextEditingController _idController = TextEditingController();
  TextEditingController _nohpController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _jurusanController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      setState(() {
        _isLoading = true;
      });
      mahasiswaService.getMahasiswaById(widget.id).then((response) {
        setState(() {
          _isLoading = false;
        });

        if (response.error) {
          errorMessage = response.errorMessage ?? 'An error occurred';
        }
        mahasiswa = response.data;
        _idController.text = mahasiswa.id;
        _nohpController.text = mahasiswa.nohp;
        _namaController.text = mahasiswa.nama;
        _emailController.text = mahasiswa.email;
        _jurusanController.text = mahasiswa.jurusan;
        _alamatController.text = mahasiswa.alamat;
        _passwordController.text = mahasiswa.password;
        _currentdate = DateFormat('dd MMMM yyyy').parse(mahasiswa.tgl_lahir);
      });
    } else {
      _currentdate = DateTime.now();
    }
  }

  // DateTime _currentdate = new DateTime.now();
  DateTime _currentdate = DateTime.now();

  Future<Null> _selectdate(BuildContext context) async {
    final DateTime _seldate = await showDatePicker(
        context: context,
        // initialDate: _currentdate == null ? DateTime.now() : _currentdate,
        initialDate: _currentdate,
        firstDate: DateTime(1945),
        lastDate: DateTime(2021),
        builder: (context, child) {
          return SingleChildScrollView(
            child: child,
          );
        });
    if (_seldate != null) {
      setState(() {
        _currentdate = _seldate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String _formattedate = new DateFormat('dd MMMM yyyy').format(_currentdate);
    return Scaffold(
      appBar: AppBar(
          title: Text(isEditing ? 'Edit Mahasiswa' : 'Create Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        TextField(
                          controller: _idController,
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20)),
                              hintText: 'ID (tidak perlu diisi)'),
                          enabled: false,
                        ),
                        Container(height: 8),
                        TextField(
                          controller: _namaController,
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20)),
                              hintText: 'Nama Lengkap',
                              labelText: 'Nama Lengkap'),
                        ),
                        Container(height: 8),
                        TextField(
                          controller: _nohpController,
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20)),
                              hintText: 'No. Handphone',
                              labelText: 'No. Handphone'),
                        ),
                        Container(height: 8),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20)),
                              hintText: 'Email',
                              labelText: 'Email'),
                        ),
                        Container(height: 8),
                        TextField(
                          controller: _jurusanController,
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20)),
                              hintText: 'Jurusan',
                              labelText: 'Jurusan'),
                        ),
                        Container(height: 8),
                        Row(
                          children: <Widget>[
                            Text(
                              'Tanggal Lahir :',
                              style: new TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Spacer()
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('$_formattedate '),
                            IconButton(
                              onPressed: () {
                                _selectdate(context);
                              },
                              icon: Icon(Icons.calendar_today),
                            ),
                          ],
                        ),
                        Container(height: 8),
                        // IconButton(
                        //   onPressed: () {
                        //     _selectdate(context);
                        //   },
                        //   icon: Icon(Icons.calendar_today),
                        // ),
                        // Container(height: 8),
                        TextField(
                          maxLines: 3,
                          controller: _alamatController,
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Alamat',
                              labelText: 'Alamat'),
                        ),
                        Container(height: 8),
                        TextField(
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Password',
                              labelText: 'Password'),
                          obscureText: true,
                          controller: _passwordController,
                        ),
                        Container(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 35,
                          child: RaisedButton(
                            child: Text('Submit',
                                style: TextStyle(color: Colors.white)),
                            color: Theme.of(context).primaryColor,
                            onPressed: () async {
                              if (isEditing) {
                                setState(() {
                                  _isLoading = true;
                                });
                                final mahasiswa = Mahasiswa(
                                    id: _idController.text,
                                    nohp: _nohpController.text,
                                    nama: _namaController.text,
                                    email: _emailController.text,
                                    jurusan: _jurusanController.text,
                                    tgl_lahir: new DateFormat('dd MMMM yyyy')
                                        .format(_currentdate),
                                    alamat: _alamatController.text,
                                    password: _passwordController.text);
                                final result = await mahasiswaService
                                    .updateMahasiswa(mahasiswa);

                                setState(() {
                                  _isLoading = false;
                                });

                                final title = 'Done';
                                final text = result.error
                                    ? (result.errorMessage ??
                                        'An error occurred')
                                    : 'Data berhasil diperbarui';

                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: Text(title),
                                          content: Text(text),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        )).then((data) {
                                  if (result.data) {
                                    Navigator.of(context).pop();
                                  }
                                });
                              } else {
                                setState(() {
                                  _isLoading = true;
                                });
                                final mahasiswa = Mahasiswa(
                                    id: _idController.text,
                                    nohp: _nohpController.text,
                                    nama: _namaController.text,
                                    email: _emailController.text,
                                    jurusan: _jurusanController.text,
                                    tgl_lahir: new DateFormat('dd MMMM yyyy')
                                        .format(_currentdate),
                                    alamat: _alamatController.text,
                                    password: _passwordController.text);
                                final result = await mahasiswaService
                                    .createMahasiswa(mahasiswa);

                                setState(() {
                                  _isLoading = false;
                                });

                                final title = 'Done';
                                final text = result.error
                                    ? (result.errorMessage ??
                                        'An error occurred')
                                    : 'Data berhasil disimpan';

                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: Text(title),
                                          content: Text(text),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        )).then((data) {
                                  if (result.data) {
                                    Navigator.of(context).pop();
                                  }
                                });
                              }
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
