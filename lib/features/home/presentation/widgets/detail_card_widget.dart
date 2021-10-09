import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/size.dart';
import '../../../../core/utils/number_format.dart';
import '../../../detail/presentation/pages/detail_page.dart';
import '../../../prospect/domain/entities/prospect.dart';
import '../../domain/entities/page_hook.dart';

class DetailCardWidget extends StatelessWidget {
  final Prospect data;
  const DetailCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      height: 230,
      width: 383,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: cardContent(),
    );
  }

  Column cardContent() {
    String diBuatTanggal = DateFormat('yyyy-MM-dd – kk:mm')
        .format(DateTime.parse(data.createdAt.toDate().toString()));
    String diUpdateTanggal = DateFormat('yyyy-MM-dd – kk:mm')
        .format(DateTime.parse(data.updatedAt.toDate().toString()));
    switch (data.stageHook) {
      case StageHook.pengajuan:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Dibuat tanggal: $diBuatTanggal"),
            Text("Di update tanggal: $diUpdateTanggal"),
            Text("Nama Nasabah: ${data.namaPelanggan}"),
            // const Spacer(),
            if (data.stageHook != StageHook.blackList &&
                data.stageHook != StageHook.validMitranet &&
                data.stageHook != StageHook.renegosiasi)
              ElevatedButton(
                onPressed: () => Get.to(() => DetailPage(data: data)),
                child: const Text('Detail'),
              ),
          ],
        );
      case StageHook.approve:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Dibuat tanggal: $diBuatTanggal"),
            Text("Di approve tanggal: $diUpdateTanggal"),
            Text("Nama Nasabah: ${data.namaPelanggan}"),
            Text("Pokok hutang: Rp ${numberFormat.format(data.pokokHutang)}"),
            Text("Tenor: ${data.tenor * 12} bulan"),
            Text("Hujrah: ${data.bunga}%"),
            if (data.stageHook != StageHook.blackList &&
                data.stageHook != StageHook.validMitranet &&
                data.stageHook != StageHook.renegosiasi)
              ElevatedButton(
                onPressed: () => Get.to(() => DetailPage(data: data)),
                child: const Text('Detail'),
              ),
          ],
        );
      case StageHook.cekFisik:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Di ajukan tanggal: $diBuatTanggal"),
            Text("Update terakhir tanggal: $diUpdateTanggal"),
            Text("Nama Nasabah: ${data.namaPelanggan}"),
            Text(
                "Jadwal Check Fisik: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.jadwalCheckFisik.toDate().toString()))}"),
            if (data.stageHook != StageHook.blackList &&
                data.stageHook != StageHook.validMitranet &&
                data.stageHook != StageHook.renegosiasi)
              ElevatedButton(
                onPressed: () => Get.to(() => DetailPage(data: data)),
                child: const Text('Detail'),
              ),
          ],
        );
      case StageHook.akad:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Di ajukan tanggal: $diBuatTanggal"),
            Text(
                "Check fisik pada tanggal: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.jadwalCheckFisik.toDate().toString()))}"),
            Text(
                "Penjadwalam akad: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.jadwalAkad.toDate().toString()))}"),
            Text("Nama Nasabah: ${data.namaPelanggan}"),
            if (data.stageHook != StageHook.blackList &&
                data.stageHook != StageHook.validMitranet &&
                data.stageHook != StageHook.renegosiasi)
              ElevatedButton(
                onPressed: () => Get.to(() => DetailPage(data: data)),
                child: const Text('Detail'),
              ),
          ],
        );
      case StageHook.validNasabah:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Di ajukan tanggal: $diBuatTanggal"),
            Text(
                "Check fisik pada tanggal: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.jadwalCheckFisik.toDate().toString()))}"),
            Text(
                "Akad pada tanggal: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.jadwalAkad.toDate().toString()))}"),
            Text(
                "Valid pada tanggal: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.updatedAt.toDate().toString()))}"),
            Text("Cair sebesar: Rp ${numberFormat.format(data.pokokHutang)}"),
            Text("Nama Nasabah: ${data.namaPelanggan}"),
            if (data.stageHook != StageHook.blackList &&
                data.stageHook != StageHook.validMitranet &&
                data.stageHook != StageHook.renegosiasi)
              ElevatedButton(
                onPressed: () => Get.to(() => DetailPage(data: data)),
                child: const Text('Detail'),
              ),
          ],
        );
      case StageHook.validMitranet:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Di ajukan tanggal: $diBuatTanggal"),
            Text(
                "Check fisik pada tanggal: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.jadwalCheckFisik.toDate().toString()))}"),
            Text(
                "Akad pada tanggal: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.jadwalAkad.toDate().toString()))}"),
            Text(
                "Mitranet Valid pada tanggal: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.updatedAt.toDate().toString()))}"),
            Text(
                "Nasabah cair sebesar: Rp ${numberFormat.format(data.pokokHutang)}"),
            Text(
                "Fee Mitranet sebesar: Rp ${numberFormat.format(data.pokokHutang * 0.07)}"),
          ],
        );
      case StageHook.blackList:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Di ajukan tanggal: $diBuatTanggal"),
            Text(
                "Update terakhir tanggal: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.updatedAt.toDate().toString()))}"),
            Text("Nama nasabah: ${data.namaPelanggan}"),
            Text("Nomor KTP: ${data.nomorKtp}"),
            const Text("Catatan: Nasabah ini tidak lulus BI checking"),
          ],
        );
      case StageHook.renegosiasi:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Di ajukan tanggal: $diBuatTanggal"),
            Text(
                "Update terakhir tanggal: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.updatedAt.toDate().toString()))}"),
            Text("Nama nasabah: ${data.namaPelanggan}"),
            Text("Nomor KTP: ${data.nomorKtp}"),
            Text(
                "Catatan: Sedang dalam proses renegosiasi di Pokok Hutang Rp ${numberFormat.format(data.pokokHutang)}"),
          ],
        );
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [Text("Maaf data kosong")],
        );
    }
  }
}
