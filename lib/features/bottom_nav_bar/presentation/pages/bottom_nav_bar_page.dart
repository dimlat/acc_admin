import 'package:flutter/material.dart';

import '../../../../core/constants/box_shadow.dart';
import '../../../../core/constants/color.dart';
import '../../../../core/constants/size.dart';
import '../../../../core/constants/wording_default.dart';
import '../../../../injection_container.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../profile/pages/profile_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  List<Widget> pageList = <Widget>[const HomePage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[bottomNavBarController.selectedIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
            bottom: kDefaultPadding,
            left: kDefaultPadding,
            right: kDefaultPadding),
        height: kDefaultPadding * 6,
        decoration:
            BoxDecoration(boxShadow: [bs31(Colors.black.withOpacity(0.3))]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultPadding),
          child: buildBottomNavigationBar(),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kColorPrimary,
      currentIndex: bottomNavBarController.selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.3),
      onTap: (value) {
        setState(() {
          bottomNavBarController.selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home), label: kLabelHome),
        BottomNavigationBarItem(
            icon: const Icon(Icons.people), label: kLabelProfil),
      ],
    );
  }
}
