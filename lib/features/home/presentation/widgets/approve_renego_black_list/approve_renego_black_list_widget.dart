import 'package:flutter/material.dart';

import '../../../../../core/constants/font_styling.dart';
import '../detail_card_widget.dart';

class ApproveRenegoBlackListWidget extends StatelessWidget {
  const ApproveRenegoBlackListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              children: [
                Text("Black List", style: kFontTitleStyle),
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
            ),
          ),
          const VerticalDivider(thickness: 2),
          Expanded(
            child: Column(
              children: [
                Text("Renegosiasi", style: kFontTitleStyle),
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
            ),
          ),
          const VerticalDivider(thickness: 2),
          Expanded(
            child: Column(
              children: [
                Text("Approve", style: kFontTitleStyle),
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
            ),
          ),
        ],
      ),
    );
  }
}
