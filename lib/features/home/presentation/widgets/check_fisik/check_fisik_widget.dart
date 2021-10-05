import 'package:flutter/material.dart';

import '../../../../../core/constants/font_styling.dart';
import '../detail_card_widget.dart';

class CheckFisikWidget extends StatelessWidget {
  const CheckFisikWidget({
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
                Text("History", style: kFontTitleStyle),
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
                Text("Latest", style: kFontTitleStyle),
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
