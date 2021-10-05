import 'package:flutter/material.dart';

import '../reusable_column_widget.dart';

class ValidWidget extends StatelessWidget {
  const ValidWidget({
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
