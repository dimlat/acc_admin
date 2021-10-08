import 'package:flutter/material.dart';

import '../../../domain/entities/page_hook.dart';
import '../reusable_column_widget.dart';

class BlackListWidget extends StatelessWidget {
  const BlackListWidget({
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
            child: ReusableColumnWidget(
              hook: PageHook(
                stage: StageHook.blackList,
                section: SectionHook.blackList,
              ),
            ),
          ),
          const VerticalDivider(thickness: 2),
        ],
      ),
    );
  }
}
