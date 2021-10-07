class PageHook {
  String stage;
  String section;
  PageHook({
    required this.stage,
    required this.section,
  });
}

class StageHook {
  static const pengajuan = "pengajuan";
  static const approve = "approve";
  static const renegosiasi = "renegosiasi";
  static const blackList = "blackList";
  static const cekFisik = "cekFisik";
  static const akad = "akad";
  static const validNasabah = "valid nasabah";
  static const validMitranet = "valid mitranet";
}

class SectionHook {
  static const read = "read";
  static const latest = "latest";
  static const approve = "approve";
  static const renegosiasi = "renegosiasi";
  static const blackList = "blackList";
  static const history = "history";
}
