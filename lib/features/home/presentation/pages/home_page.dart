import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/constants/color.dart';
import 'composition/content_menu.dart';
import 'composition/notif_menu.dart';
import 'composition/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          centerTitle: false,
          backgroundColor: kColorDarkPrimary,
          elevation: 0,
          iconTheme: IconThemeData(
            color: kColorFontPrimary,
          ),
        ),
        body: Row(
          children: const [
            Flexible(
              flex: 2,
              child: SideMenu(),
            ),
            Flexible(
              flex: 6,
              child: ContentMenu(),
            ),
            Flexible(
              flex: 1,
              child: NotifMenu(),
            ),
          ],
        ),
      ),
    );
  }
}
