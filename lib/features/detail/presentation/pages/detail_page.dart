import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/color.dart';
import '../../../../core/constants/loader.dart';
import '../../../../core/constants/size.dart';
import '../../../../injection_container.dart';
import '../../../bottom_nav_bar/presentation/pages/bottom_nav_bar_page.dart';
import '../../../home/domain/entities/page_hook.dart';
import '../../../prospect/domain/entities/prospect.dart';

class DetailPage extends StatelessWidget {
  final Prospect data;
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
                      Text(
                          "Last Update: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.updatedAt.toDate().toString()))}"),
                      Text("Nama Nasabah: ${data.namaPelanggan}"),
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

  Widget pickAction(Prospect data) {
    switch (data.stageHook) {
      case StageHook.pengajuan:
        return actionPengajuan(data);
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

  Widget actionCekFisik() => Builder(builder: (context) {
        return Row(
          children: [
            ElevatedButton(
              onPressed: () {
                DatePicker.showDateTimePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime.now(),
                  maxTime: DateTime(2022, 6, 7, 05, 09),
                  onConfirm: (date) async {
                    onLoading();
                    await restFirestoreController.updateReturnBool(
                      collection: Prospect.modelName,
                      handle: data.handle,
                      data: {
                        "updatedAt": FieldValue.serverTimestamp(),
                        "jadwalAkad": date,
                        "stageHook": StageHook.akad,
                      },
                    );
                    2.delay();
                    unLoading;
                    Get.offAll(() => const BottomNavBarPage());
                  },
                  locale: LocaleType.id,
                );
              },
              child: const Text('Jadwalkan Akad'),
            ),
            kWidht(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Renego'),
            ),
          ],
        );
      });

  Widget actionApprove() => Builder(builder: (context) {
        return ElevatedButton(
          onPressed: () {
            DatePicker.showDateTimePicker(
              context,
              showTitleActions: true,
              minTime: DateTime.now(), //DateTime(2021, 5, 5, 20, 50),
              maxTime: DateTime(2022, 6, 7, 05, 09),
              // onChanged: (date) {
              //   print('change $date in time zone ' +
              //       date.timeZoneOffset.inHours.toString());
              // },
              onConfirm: (date) async {
                onLoading();
                await restFirestoreController.updateReturnBool(
                  collection: Prospect.modelName,
                  handle: data.handle,
                  data: {
                    "updatedAt": FieldValue.serverTimestamp(),
                    "jadwalCheckFisik": date,
                    "stageHook": StageHook.cekFisik,
                  },
                );
                2.delay();
                unLoading;
                Get.offAll(() => const BottomNavBarPage());
              },
              locale: LocaleType.id,
            );
          },
          child: const Text('Jadwalkan Pengecekan Fisik'),
        );
      });

  Widget actionRenegosiasi() => const Text("Menunggu Renegosiasi");

  Row actionPengajuan(Prospect data) {
    if (!data.isRead) {
      restFirestoreController.updateReturnBool(
        collection: Prospect.modelName,
        handle: data.handle,
        data: {
          "isRead": true,
          "updatedAt": FieldValue.serverTimestamp(),
        },
      );
    }

    return Row(
      children: [
        ElevatedButton(
          onPressed: () async {
            onLoading();
            await restFirestoreController.updateReturnBool(
              collection: Prospect.modelName,
              handle: data.handle,
              data: {
                "stageHook": StageHook.approve,
                "updatedAt": FieldValue.serverTimestamp(),
              },
            );
            2.delay();
            unLoading;
            Get.offAll(() => const BottomNavBarPage());
          },
          child: const Text('Approve'),
        ),
        kWidht(),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Resubmit Data'),
        ),
        kWidht(),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Renego'),
        ),
        kWidht(),
        ElevatedButton(
          onPressed: () async {
            onLoading();
            await restFirestoreController.updateReturnBool(
              collection: Prospect.modelName,
              handle: data.handle,
              data: {
                "stageHook": StageHook.blackList,
                "updatedAt": FieldValue.serverTimestamp(),
              },
            );
            2.delay();
            unLoading;
            Get.offAll(() => const BottomNavBarPage());
          },
          child: const Text('Black List'),
        ),
      ],
    );
  }
}
