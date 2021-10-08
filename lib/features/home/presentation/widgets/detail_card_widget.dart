import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/size.dart';
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
      height: 100,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
              "Last Update: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(data.updatedAt.toDate().toString()))}"),
          Text("Nama Nasabah: ${data.namaPelanggan}"),
          Text("Nomor Telp: ${data.nomorTelp}"),
          const Spacer(),
          if (data.stageHook != StageHook.blackList)
            Expanded(
              flex: 4,
              child: ElevatedButton(
                onPressed: () => Get.to(() => DetailPage(data: data)),
                child: const Text('Detail'),
              ),
            )
        ],
      ),
    );
  }
}
