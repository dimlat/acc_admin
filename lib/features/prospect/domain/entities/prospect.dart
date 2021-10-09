import 'dart:convert';

class Prospect {
  static const modelName = "prospects";

  int bunga;
  String fotoKtp;
  String fotoNpwp;
  String handle;
  String handleUser;
  int hargaPasar;
  String namaPelanggan;
  String nomorKtp;
  String nomorTelp;
  int pokokHutang;
  String stageHook;
  int tenor;
  dynamic createdAt;
  bool isRead;
  dynamic updatedAt;
  dynamic jadwalCheckFisik;
  dynamic jadwalAkad;

  Prospect({
    required this.bunga,
    required this.fotoKtp,
    required this.fotoNpwp,
    required this.handle,
    required this.handleUser,
    required this.hargaPasar,
    required this.namaPelanggan,
    required this.nomorKtp,
    required this.nomorTelp,
    required this.pokokHutang,
    required this.stageHook,
    required this.tenor,
    required this.createdAt,
    required this.isRead,
    required this.updatedAt,
    this.jadwalCheckFisik,
    this.jadwalAkad,
  });

  Map<String, dynamic> toMap() {
    return {
      'bunga': bunga,
      'fotoKtp': fotoKtp,
      'fotoNpwp': fotoNpwp,
      'handle': handle,
      'handleUser': handleUser,
      'hargaPasar': hargaPasar,
      'namaPelanggan': namaPelanggan,
      'nomorKtp': nomorKtp,
      'nomorTelp': nomorTelp,
      'pokokHutang': pokokHutang,
      'stageHook': stageHook,
      'tenor': tenor,
      'createdAt': createdAt,
      'isRead': isRead,
      'updatedAt': updatedAt,
      'jadwalCheckFisik': jadwalCheckFisik,
      'jadwalAkad': jadwalAkad,
    };
  }

  factory Prospect.fromMap(Map<String, dynamic> map) {
    return Prospect(
      bunga: map['bunga'],
      fotoKtp: map['fotoKtp'],
      fotoNpwp: map['fotoNpwp'],
      handle: map['handle'],
      handleUser: map['handleUser'],
      hargaPasar: map['hargaPasar'],
      namaPelanggan: map['namaPelanggan'],
      nomorKtp: map['nomorKtp'],
      nomorTelp: map['nomorTelp'],
      pokokHutang: map['pokokHutang'],
      stageHook: map['stageHook'],
      tenor: map['tenor'],
      createdAt: map['createdAt'],
      isRead: map['isRead'],
      updatedAt: map['updatedAt'],
      jadwalCheckFisik: map['jadwalCheckFisik'],
      jadwalAkad: map['jadwalAkad'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Prospect.fromJson(String source) =>
      Prospect.fromMap(json.decode(source));
}
