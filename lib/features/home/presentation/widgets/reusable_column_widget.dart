import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/font_styling.dart';
import '../../../../injection_container.dart';
import '../../../see_all/presentation/pages/see_all_page.dart';
import '../../domain/entities/page_hook.dart';
import 'detail_card_widget.dart';

class ReusableColumnWidget extends StatelessWidget {
  final PageHook? hook;
  const ReusableColumnWidget({
    Key? key,
    required this.hook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(hook!.section, style: kFontTitleStyle),
            GestureDetector(
                onTap: () => Get.to(() => SeeAllPage(hook: hook)),
                child: Text("Lihat Semua", style: kFontSubTitleStyle)),
          ],
        ),
        FutureBuilder(
          future: tenLastDataController.route(hook!),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data.length == 0) {
              return const Center(child: Text("No Data"));
            }
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = snapshot.data[index];
                  return DetailCardWidget(data: data);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
