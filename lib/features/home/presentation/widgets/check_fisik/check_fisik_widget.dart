import 'package:flutter/material.dart';

import '../reusable_column_widget.dart';

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
        children: const [
          Expanded(child: ReusableColumnWidget(title: "History")),
          VerticalDivider(thickness: 2),
          Expanded(child: ReusableColumnWidget(title: "Latest")),
        ],
      ),
    );
  }
}