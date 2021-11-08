import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/constants/color.dart';
import '../../../../core/constants/font_styling.dart';
import '../../../../core/constants/size.dart';
import '../widgets/akad/akad_widget.dart';
import '../widgets/approve/approve_widget.dart';
import '../widgets/black_list/black_list_widget.dart';
import '../widgets/pengajuan/pengajuan_widget.dart';
import '../widgets/renego/renego_widget.dart';
import '../widgets/reusable_container_widget.dart';
import '../widgets/terbaca/pengajuan_terbaca_widget.dart';
import '../widgets/valid_mitranet/valid_mitranet_widget.dart';

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
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: LayoutBuilder(
              builder: (
                BuildContext context,
                BoxConstraints viewportConstraints,
              ) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: viewportConstraints.maxHeight,
                    maxWidth: 800,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(
                            () => const ReusableContainerWidget(
                              child: PengajuanWidget(),
                              pageTitle: "Pengajuan",
                            ),
                          ),
                          child: Text("Pengajuan", style: kFontHeaderStyle),
                        ),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(
                            () => const ReusableContainerWidget(
                              child: PengajuanTerbacaWidget(),
                              pageTitle: "Terbaca",
                            ),
                          ),
                          child: Text("Dibaca", style: kFontHeaderStyle),
                        ),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(
                            () => const ReusableContainerWidget(
                              child: RenegoWidget(),
                              pageTitle: "Re-Nego",
                            ),
                          ),
                          child: Text("Renego", style: kFontHeaderStyle),
                        ),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(
                            () => const ReusableContainerWidget(
                              child: ApproveWidget(),
                              pageTitle: "Approve",
                            ),
                          ),
                          child: Text("Approve", style: kFontHeaderStyle),
                        ),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(
                            () => const ReusableContainerWidget(
                              child: AkadWidget(),
                              pageTitle: "Akad",
                            ),
                          ),
                          child: Text("Akad", style: kFontHeaderStyle),
                        ),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(
                            () => const ReusableContainerWidget(
                              child: ValidMitranetWidget(),
                              pageTitle: "Valid Mitranet",
                            ),
                          ),
                          child:
                              Text("Valid Mitranet", style: kFontHeaderStyle),
                        ),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(
                            () => const ReusableContainerWidget(
                              child: BlackListWidget(),
                              pageTitle: "Black List",
                            ),
                          ),
                          child: Text("Black List", style: kFontHeaderStyle),
                        ),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
