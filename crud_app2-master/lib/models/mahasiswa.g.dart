// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mahasiswa _$MahasiswaFromJson(Map<String, dynamic> json) {
  return Mahasiswa(
    id: json['id'] as String,
    nohp: json['nohp'] as String,
    nama: json['nama'] as String,
    email: json['email'] as String,
    jurusan: json['jurusan'] as String,
    tgl_lahir: json['tgl_lahir'] as String,
    alamat: json['alamat'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$MahasiswaToJson(Mahasiswa instance) => <String, dynamic>{
      'id': instance.id,
      'nohp': instance.nohp,
      'nama': instance.nama,
      'email': instance.email,
      'jurusan': instance.jurusan,
      'tgl_lahir': instance.tgl_lahir,
      'alamat': instance.alamat,
      'password': instance.password,
    };
