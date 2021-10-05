import 'package:flutter/material.dart';

import '../../../../core/constants/font_styling.dart';
import 'detail_card_widget.dart';

class ReusableColumnWidget extends StatelessWidget {
  final String? title;
  const ReusableColumnWidget({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title!, style: kFontTitleStyle),
            Text("Lihat Semua", style: kFontSubTitleStyle),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                DetailCardWidget(),
                DetailCardWidget(),
                DetailCardWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
