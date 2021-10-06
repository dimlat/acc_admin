import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/font_styling.dart';
import '../../../see_all/presentation/pages/see_all_page.dart';
import '../../domain/entities/page_hook.dart';
import 'detail_card_widget.dart';
import 'pengajuan/pengajuan_dummy_data.dart';

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
        Expanded(
          child: SingleChildScrollView(
            child: Column(
                children: [for (var el in latest) DetailCardWidget(data: el)]),
          ),
        ),
      ],
    );
  }
}
