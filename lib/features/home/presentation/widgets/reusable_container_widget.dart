import 'package:flutter/material.dart';

import '../../../../core/constants/color.dart';
import '../../../../core/constants/size.dart';

class ReusableContainerWidget extends StatelessWidget {
  final Widget? child;
  final String? pageTitle;
  const ReusableContainerWidget({
    Key? key,
    @required this.child,
    @required this.pageTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle ?? ""),
        centerTitle: false,
        backgroundColor: kColorDarkPrimary,
        elevation: 0,
        iconTheme: IconThemeData(
          color: kColorFontPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: false,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
