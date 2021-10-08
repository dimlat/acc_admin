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
        onPressed: () async {
          onLoading();
          await restFirestoreController.updateReturnBool(
            collection: Prospect.modelName,
            handle: data.handle,
            data: {
              "stageHook": StageHook.validMitranet,
              "updatedAt": FieldValue.serverTimestamp(),
            },
          );
          await 1.delay();
          unLoading;
          Get.offAll(() => const BottomNavBarPage());
        },
        child: const Text('Valid MitraNet'),
      );

  Widget actionAkad() => ElevatedButton(
        onPressed: () async {
          onLoading();
          restFirestoreController.updateReturnBool(
            collection: Prospect.modelName,
            handle: data.handle,
            data: {
              "stageHook": StageHook.validNasabah,
              "updatedAt": FieldValue.serverTimestamp(),
            },
          );
          await 1.delay();
          unLoading;
          Get.offAll(() => const BottomNavBarPage());
        },
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
                    await 1.delay();
                    unLoading;
                    Get.offAll(() => const BottomNavBarPage());
                  },
                  locale: LocaleType.id,
                );
              },
              child: const Text('Jadwalkan Akad'),
            ),
            kWidht(),
            RenegoPlafon(data: data),
          ],
        );
      });

  Widget actionApprove() => Builder(builder: (context) {
        return ElevatedButton(
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
                    "jadwalCheckFisik": date,
                    "stageHook": StageHook.cekFisik,
                  },
                );
                await 1.delay();
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

  Column actionPengajuan(Prospect data) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        kHeight(),
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
            await 1.delay();
            unLoading;
            Get.offAll(() => const BottomNavBarPage());
          },
          child: const Text('Approve'),
        ),
        kHeight(),
        ElevatedButton(
          onPressed: () {
            Get.snackbar(
              "Comming Soon",
              "Dalam pengembangan",
              icon: const Icon(Icons.person, color: Colors.white),
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: const Text('Resubmit Data'),
        ),
        kHeight(),
        RenegoPlafon(data: data),
        kHeight(),
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
            await 1.delay();
            unLoading;
            Get.offAll(() => const BottomNavBarPage());
          },
          child: const Text('Black List'),
        ),
      ],
    );
  }
}

class RenegoPlafon extends StatelessWidget {
  final Prospect? data;
  const RenegoPlafon({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
        String jumlah = "";
        Get.defaultDialog(
          title: "Perubahan Plafon",
          content: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  onChanged: (test) {
                    jumlah = test;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan Penawaran',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'harus ada penawaran';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          onLoading();
                          await restFirestoreController.updateReturnBool(
                            collection: Prospect.modelName,
                            handle: data!.handle,
                            data: {
                              "pokokHutang": int.parse(jumlah),
                              "updatedAt": FieldValue.serverTimestamp(),
                              "stageHook": StageHook.renegosiasi
                            },
                          );
                          await 1.delay();
                          unLoading;
                          Get.offAll(() => const BottomNavBarPage());
                        }
                      },
                      child: const Text('Renego'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          textCancel: "Batal",
        );
      },
      child: const Text('Renego'),
    );
  }
}
