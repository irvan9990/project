import 'package:crud_app2/models/mahasiswa.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:crud_app2/services/mahasiswas_service.dart';

import 'models/api_response.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  MahasiswasService get service => GetIt.I<MahasiswasService>();
  APIResponse<List<Mahasiswa>> _apiResponse;
  APIResponse<Mahasiswa> _apiResponseGetById;
  APIResponse<bool> _apiResponseCreateMahasiswa;
  APIResponse<bool> _apiResponseUpdateMahasiswa;
  APIResponse<bool> _apiResponseDeleteMahasiswa;

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

    Mahasiswa mahasiswa;

    // // TEST GET MAHASISWA
    // _apiResponse = await service.getMahasiswaList();
    // print("Length API Response : ${_apiResponse.data.length}");

    // for (Mahasiswa item in _apiResponse.data) {
    //   print(item.id + "\t" + item.nohp + "\t" + item.nama + "\t" + item.jurusan);
    // }

    // // TEST GET BY ID
    // _apiResponseGetById = await service.getMahasiswaById('2');
    // mahasiswa = _apiResponseGetById.data;
    // print(mahasiswa.nohp + "\t" + mahasiswa.nama + "\t" + mahasiswa.jurusan);

    // // TEST CREATE MAHASISWA
    // var tempMahasiswa = Mahasiswa(
    //     nohp: '098765434',
    //     nama: 'Koding 3',
    //     email: 'koding@gmail.com',
    //     jurusan: 'Teknik');
    // _apiResponseCreateMahasiswa = await service.createMahasiswa(tempMahasiswa);
    // final text = _apiResponseCreateMahasiswa.error
    //     ? (_apiResponseCreateMahasiswa.errorMessage ?? 'An error occurred')
    //     : 'Data berhasil disimpan';
    // print(text);

    // TEST UPDATE MAHASISWA
    var tempMahasiswa = Mahasiswa(
        id: '45',
        nohp: '12345609',
        nama: 'Koding aja',
        email: 'aja@kdoing.com',
        jurusan: 'UBAH1');
    _apiResponseUpdateMahasiswa = await service.updateMahasiswa(tempMahasiswa);
    final text = _apiResponseUpdateMahasiswa.error
        ? (_apiResponseUpdateMahasiswa.errorMessage ?? 'An error occurred')
        : 'Update Data Berhasil';
    print(text);

    // // TEST DELETE MAHASISWA
    // _apiResponseDeleteMahasiswa = await service.deleteMahasiswa('41');
    // var message = '';
    // if (_apiResponseDeleteMahasiswa != null &&
    //     _apiResponseDeleteMahasiswa.data == true) {
    //   message = 'Data Mahasiswa berhasil dihapus';
    // } else {
    //   message = _apiResponseDeleteMahasiswa?.errorMessage ?? 'An error occrued';
    // }
    // print(message);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
