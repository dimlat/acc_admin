import 'package:flutter/material.dart';

import '../../../../core/constants/color.dart';
import '../../../../core/constants/size.dart';
import '../../../home/domain/entities/page_hook.dart';

class SeeAllPage extends StatelessWidget {
  final PageHook? hook;
  const SeeAllPage({Key? key, this.hook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Semua ${hook!.stage}"),
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
                    children: const [
                      Text("Halaman ini sedang dalam pengembahangan"),
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
