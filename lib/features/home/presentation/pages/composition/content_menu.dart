import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/controllers/page_controller/page_name_static_class.dart';
import '../../../../../injection_container.dart';
import '../../widgets/akad/akad_widget.dart';
import '../../widgets/approve/approve_widget.dart';
import '../../widgets/pengajuan/pengajuan_widget.dart';
import '../../widgets/renego/renego_widget.dart';
import '../../widgets/reusable_container_widget.dart';
import '../../widgets/terbaca/pengajuan_terbaca_widget.dart';
import '../../widgets/valid_mitranet/valid_mitranet_widget.dart';

class ContentMenu extends StatelessWidget {
  const ContentMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => getPageWidget());
  }
}

Widget getPageWidget() {
  Widget pageWidget;
  switch (pageController.subPageShow.value) {
    case PageNameStaticClass.home:
      pageWidget = const Text("should be the dashboard");
      break;
    case PageNameStaticClass.pengajuan:
      pageWidget = const ReusableContainerWidget(
        child: PengajuanWidget(),
        pageTitle: "Pengajuan",
      );
      break;
    case PageNameStaticClass.terbaca:
      pageWidget = const ReusableContainerWidget(
        child: PengajuanTerbacaWidget(),
        pageTitle: "Terbaca",
      );
      break;
    case PageNameStaticClass.renego:
      pageWidget = const ReusableContainerWidget(
        child: RenegoWidget(),
        pageTitle: "Renego",
      );
      break;
    case PageNameStaticClass.approve:
      pageWidget = const ReusableContainerWidget(
        child: ApproveWidget(),
        pageTitle: "Approve",
      );
      break;
    case PageNameStaticClass.akad:
      pageWidget = const ReusableContainerWidget(
        child: AkadWidget(),
        pageTitle: "Akad",
      );
      break;
    case PageNameStaticClass.validMitranet:
      pageWidget = const ReusableContainerWidget(
        child: ValidMitranetWidget(),
        pageTitle: "Valid Mitranet",
      );
      break;
    case PageNameStaticClass.blackList:
      pageWidget = const ReusableContainerWidget(
        child: PengajuanTerbacaWidget(),
        pageTitle: "Black List",
      );
      break;
    default:
      pageWidget = const Text("Sorry this page doesnt exist");
  }
  return pageWidget;
}
