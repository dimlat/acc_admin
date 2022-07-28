import 'dart:convert';

class ReturnMonthlyCalculation {
  int totalBungaACP;
  int totalBunga;
  int totalAsuransiKredit;
  int cicilanPerbulan;

  double presentaseBunga;

  ReturnMonthlyCalculation({
    required this.totalBungaACP,
    required this.totalBunga,
    required this.totalAsuransiKredit,
    required this.cicilanPerbulan,
    required this.presentaseBunga,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalBungaACP': totalBungaACP,
      'totalBunga': totalBunga,
      'totalAsuransiKredit': totalAsuransiKredit,
      'cicilanPerbulan': cicilanPerbulan,
      'presentaseBunga': presentaseBunga,
    };
  }

  factory ReturnMonthlyCalculation.fromMap(Map<String, dynamic> map) {
    return ReturnMonthlyCalculation(
      totalBungaACP: map['totalBungaACP']?.toInt() ?? 0,
      totalBunga: map['totalBunga']?.toInt() ?? 0,
      totalAsuransiKredit: map['totalAsuransiKredit']?.toInt() ?? 0,
      cicilanPerbulan: map['cicilanPerbulan']?.toInt() ?? 0,
      presentaseBunga: map['presentaseBunga']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReturnMonthlyCalculation.fromJson(String source) =>
      ReturnMonthlyCalculation.fromMap(json.decode(source));
}
