import 'package:flutter/material.dart';

import '../../../domain/entities/page_hook.dart';
import '../reusable_column_widget.dart';

class ValidMitranetWidget extends StatelessWidget {
  const ValidMitranetWidget({
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
              hook:
                  PageHook(stage: StageHook.validMitranet, section: SectionHook.latest),
            ),
          ),
        ],
      ),
    );
  }
}
