import 'dart:convert';

import 'car_entity.dart';
import 'return_monthly_calculation.dart';

class DataDetailTransaksi {
  int pokokHutang;
  int hargaPasar;
  int tenor;

  double asuransiTahun2;
  double asuransiTahun3;

  ReturnMonthlyCalculation infoCicilan;
  CarEntity infoMobil;
  DataDetailTransaksi({
    required this.pokokHutang,
    required this.hargaPasar,
    required this.tenor,
    required this.asuransiTahun2,
    required this.asuransiTahun3,
    required this.infoCicilan,
    required this.infoMobil,
  });

  Map<String, dynamic> toMap() {
    return {
      'pokokHutang': pokokHutang,
      'hargaPasar': hargaPasar,
      'tenor': tenor,
      'asuransiTahun2': asuransiTahun2,
      'asuransiTahun3': asuransiTahun3,
      'infoCicilan': infoCicilan.toMap(),
      'infoMobil': infoMobil.toMap(),
    };
  }

  factory DataDetailTransaksi.fromMap(Map<String, dynamic> map) {
    return DataDetailTransaksi(
      pokokHutang: map['pokokHutang']?.toInt() ?? 0,
      hargaPasar: map['hargaPasar']?.toInt() ?? 0,
      tenor: map['tenor']?.toInt() ?? 0,
      asuransiTahun2: map['asuransiTahun2']?.toDouble() ?? 0.0,
      asuransiTahun3: map['asuransiTahun3']?.toDouble() ?? 0.0,
      infoCicilan: ReturnMonthlyCalculation.fromMap(map['infoCicilan'] ?? {}),
      infoMobil: CarEntity.fromMap(map['infoMobil'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataDetailTransaksi.fromJson(String source) =>
      DataDetailTransaksi.fromMap(json.decode(source));
}
