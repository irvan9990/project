import 'package:json_annotation/json_annotation.dart';

part 'mahasiswa.g.dart';

@JsonSerializable()
class Mahasiswa {
  String id;
  String nohp;
  String nama;
  String email;
  String jurusan;
  String tgl_lahir;
  String alamat;
  String password;

  Mahasiswa(
      {this.id,
      this.nohp,
      this.nama,
      this.email,
      this.jurusan,
      this.tgl_lahir,
      this.alamat,
      this.password});

  factory Mahasiswa.fromJson(Map<String, dynamic> item) =>
      _$MahasiswaFromJson(item);

  Map<String, dynamic> toJson() => _$MahasiswaToJson(this);
}
