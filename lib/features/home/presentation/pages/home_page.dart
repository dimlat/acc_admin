import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/constants/color.dart';
import '../../../../core/constants/font_styling.dart';
import '../../../../core/constants/size.dart';
import '../widgets/akad/akad_widget.dart';
import '../widgets/approve_renego_black_list/approve_renego_black_list_widget.dart';
import '../widgets/check_fisik/check_fisik_widget.dart';
import '../widgets/pengajuan/pengajuan_widget.dart';
import '../widgets/reusable_container_widget.dart';
import '../widgets/valid/valid_widget.dart';

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
                        Text("Pengajuan", style: kFontHeaderStyle),
                        const ReusableContainerWidget(child: PengajuanWidget()),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        Text("Black List / Nego / Approve",
                            style: kFontHeaderStyle),
                        const ReusableContainerWidget(
                            child: ApproveRenegoBlackListWidget()),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        Text("Check Fisik", style: kFontHeaderStyle),
                        const ReusableContainerWidget(
                            child: CheckFisikWidget()),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        Text("Akad", style: kFontHeaderStyle),
                        const ReusableContainerWidget(child: AkadWidget()),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        Text("Valid", style: kFontHeaderStyle),
                        const ReusableContainerWidget(child: ValidWidget()),
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
