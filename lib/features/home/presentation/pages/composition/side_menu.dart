import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/asset_path.dart';
import '../../../../../core/constants/color.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../core/controllers/page_controller/page_name_static_class.dart';
import '../../../../../injection_container.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(kDefaultPadding),
                  child: Image.asset(logoSmall,
                      height: 100, filterQuality: FilterQuality.high),
                ),
                const Text("Version 1.0"),
              ],
            ),
          ),
          DrawerListTile(
            staticPageName: PageNameStaticClass.home,
            title: "Home",
            iconData: Icons.home,
            press: () =>
                pageController.subPageShow.value = PageNameStaticClass.home,
          ),
          DrawerListTile(
              staticPageName: PageNameStaticClass.pengajuan,
              title: "Pengajuan",
              iconData: Icons.list,
              press: () => pageController.subPageShow.value =
                  PageNameStaticClass.pengajuan),
          DrawerListTile(
              staticPageName: PageNameStaticClass.terbaca,
              title: "Terbaca",
              iconData: Icons.receipt,
              press: () => pageController.subPageShow.value =
                  PageNameStaticClass.terbaca),
          DrawerListTile(
              staticPageName: PageNameStaticClass.renego,
              title: "Renego",
              iconData: Icons.hourglass_bottom_sharp,
              press: () => pageController.subPageShow.value =
                  PageNameStaticClass.renego),
          DrawerListTile(
              staticPageName: PageNameStaticClass.approve,
              title: "Approve",
              iconData: Icons.approval,
              press: () => pageController.subPageShow.value =
                  PageNameStaticClass.approve),
          DrawerListTile(
              staticPageName: PageNameStaticClass.akad,
              title: "Akad",
              iconData: Icons.air_outlined,
              press: () =>
                  pageController.subPageShow.value = PageNameStaticClass.akad),
          DrawerListTile(
              staticPageName: PageNameStaticClass.validMitranet,
              title: "Valid Mitranet",
              iconData: Icons.monetization_on,
              press: () => pageController.subPageShow.value =
                  PageNameStaticClass.validMitranet),
          DrawerListTile(
            staticPageName: PageNameStaticClass.blackList,
            title: "Black List",
            iconData: Icons.no_accounts,
            press: () => pageController.subPageShow.value =
                PageNameStaticClass.blackList,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.iconData,
    required this.staticPageName,
    required this.press,
  }) : super(key: key);

  final String title, staticPageName;
  final IconData iconData;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isItMe = pageController.subPageShow.value == staticPageName;
      return ListTile(
        tileColor: isItMe ? Colors.grey.withOpacity(0.1) : null,
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: Icon(
          iconData,
          color: isItMe ? Colors.blue : Colors.black,
          size: 24.0,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: isItMe ? kColorPrimary : Colors.black,
              fontFamily: 'AkayaTelivigala',
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
      );
    });
  }
}
