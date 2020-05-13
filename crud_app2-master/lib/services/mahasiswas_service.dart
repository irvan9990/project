import 'dart:convert';
import 'package:crud_app2/models/api_response.dart';
import 'package:crud_app2/models/mahasiswa.dart';
import 'package:http/http.dart' as http;

class MahasiswasService {
  static const API = 'http://192.168.0.10/rest-api/api';
  static const headers = {'Content-Type': 'application/json'};

  Future<APIResponse<List<Mahasiswa>>> getMahasiswaList() {
    return http.get(API + '/mahasiswa', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final mahasiswas = <Mahasiswa>[];
        for (var item in jsonData) {
          mahasiswas.add(Mahasiswa.fromJson(item));
        }
        return APIResponse<List<Mahasiswa>>(data: mahasiswas);
      }
      return APIResponse<List<Mahasiswa>>(
          error: true, errorMessage: 'An error occuredD');
    }).catchError((_) => APIResponse<List<Mahasiswa>>(
        error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Mahasiswa>> getMahasiswaById(String idMahasiswa) {
    return http
        .get(API + '/mahasiswa?id=' + idMahasiswa, headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final mahasiswas = <Mahasiswa>[];
        for (var item in jsonData) {
          mahasiswas.add(Mahasiswa.fromJson(item));
        }
        print("Mahasiswas length : ${mahasiswas.length}");
        Mahasiswa mahasiswa;
        if (mahasiswas.length == 1) mahasiswa = mahasiswas[0];
        return APIResponse<Mahasiswa>(data: mahasiswa);
      }
      return APIResponse<Mahasiswa>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<Mahasiswa>(
            error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createMahasiswa(Mahasiswa item) {
    return http
        .post(API + '/mahasiswa',
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateMahasiswa(Mahasiswa item) {
    return http
        .put(API + '/mahasiswa',
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> deleteMahasiswa(String id) {
    return http
        .delete(API + '/mahasiswa?id=' + id, headers: headers)
        .then((data) {
      print('Hasil Mahasiswa Delete:');
      print(json.decode(data.body));
      print((data.statusCode));
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> loginMahasiswa(Mahasiswa item) {
    return http
        .post(API + '/mahasiswa',
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if ((data.statusCode == 200) && (data.body.contains("Success"))) {
        print("ISI body");
        print(json.decode(data.body));
        print(data.toString());
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}
