import 'package:flutter/material.dart';

import '../../../../core/constants/color.dart';
import '../../../../core/constants/size.dart';
import '../../../home/domain/entities/page_hook.dart';

class DetailPage extends StatelessWidget {
  final dynamic data;
  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
          centerTitle: false,
          backgroundColor: kColorDarkPrimary,
          elevation: 0,
          iconTheme: IconThemeData(
            color: kColorFontPrimary,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: LayoutBuilder(
            builder: (
              BuildContext context,
              BoxConstraints viewportConstraints,
            ) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: viewportConstraints.maxHeight,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Last Update: ${data['lastUpdate']}"),
                      Text("Nama Nasabah: ${data['namaNasabah']}"),
                      Text("Expired: ${data['expired']}"),
                      pickAction(data)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget pickAction(data) {
    switch (data["stageHook"]) {
      case StageHook.pengajuan:
        return actionPengajuan();
      case StageHook.approve:
        return actionApprove();
      case StageHook.renegosiasi:
        return actionRenegosiasi();
      case StageHook.blackList:
        return const Text("Ini adalah akhir dari proses");
      case StageHook.akad:
        return actionAkad();
      case StageHook.validNasabah:
        return actionValid();
      case StageHook.cekFisik:
        return actionCekFisik();
      case StageHook.validMitranet:
        return const Text("Ini adalah akhir dari proses");
      default:
        return const Text("Proses tidak teridentifikasi");
    }
  }

  Widget actionValid() => ElevatedButton(
        onPressed: () {},
        child: const Text('Valid MitraNet'),
      );

  Widget actionAkad() => ElevatedButton(
        onPressed: () {},
        child: const Text('Konfirmasi Nasabah Valid'),
      );

  Widget actionCekFisik() => ElevatedButton(
        onPressed: () {},
        child: const Text('Jadwalkan Akad'),
      );

  Widget actionApprove() => ElevatedButton(
        onPressed: () {},
        child: const Text('Jadwalkan Pengecekan Fisik'),
      );

  Widget actionRenegosiasi() => const Text("Menunggu Renegosiasi");

  Row actionPengajuan() {
    // TODO: data is read
    debugPrint("ada data pengajuan yang di read");
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Approve'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Resubmit Data'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Renego'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Black List'),
        ),
      ],
    );
  }
}
