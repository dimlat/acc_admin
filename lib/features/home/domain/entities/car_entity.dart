import 'dart:convert';

class CarEntity {
  static const String docName = "cars";

  String cariJenis;
  String cariMerk;
  String cariTipe;
  String handle;
  String jenis;
  String merk;
  String tipe;

  int harga;
  int tahun;

  CarEntity({
    required this.cariJenis,
    required this.cariMerk,
    required this.cariTipe,
    required this.handle,
    required this.jenis,
    required this.merk,
    required this.tipe,
    required this.harga,
    required this.tahun,
  });

  Map<String, dynamic> toMap() {
    return {
      'cariJenis': cariJenis,
      'cariMerk': cariMerk,
      'cariTipe': cariTipe,
      'handle': handle,
      'jenis': jenis,
      'merk': merk,
      'tipe': tipe,
      'harga': harga,
      'tahun': tahun,
    };
  }

  factory CarEntity.fromMap(Map<String, dynamic> map) {
    return CarEntity(
      cariJenis: map['cariJenis'] ?? '',
      cariMerk: map['cariMerk'] ?? '',
      cariTipe: map['cariTipe'] ?? '',
      handle: map['handle'] ?? '',
      jenis: map['jenis'] ?? '',
      merk: map['merk'] ?? '',
      tipe: map['tipe'] ?? '',
      harga: map['harga']?.toInt() ?? 0,
      tahun: map['tahun']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarEntity.fromJson(String source) =>
      CarEntity.fromMap(json.decode(source));
}
