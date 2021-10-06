import 'package:flutter/material.dart';

import '../../../../core/constants/color.dart';
import '../../../../core/constants/size.dart';
import '../../../../core/constants/wording_default.dart';

class DetailPage extends StatelessWidget {
  final dynamic data;
  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("DetailPage"),
          centerTitle: false,
          backgroundColor: kColorDarkPrimary,
          elevation: 0,
          iconTheme: IconThemeData(
            color: kColorFontPrimary,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: LayoutBuilder(
            builder: (
              BuildContext context,
              BoxConstraints viewportConstraints,
            ) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: viewportConstraints.maxHeight,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(kDefaultTextContent),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
