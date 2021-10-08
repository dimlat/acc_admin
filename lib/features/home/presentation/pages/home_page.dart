import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/constants/color.dart';
import '../../../../core/constants/font_styling.dart';
import '../../../../core/constants/size.dart';
import '../widgets/akad/akad_widget.dart';
import '../widgets/approve/approve_widget.dart';
import '../widgets/black_list/black_list_widget.dart';
import '../widgets/check_fisik/check_fisik_widget.dart';
import '../widgets/pengajuan/pengajuan_widget.dart';
import '../widgets/renego/renego_widget.dart';
import '../widgets/reusable_container_widget.dart';
import '../widgets/valid_mitranet/valid_mitranet_widget.dart';
import '../widgets/valid_nasabah/valid_nasabah_widget.dart';

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
                        Text("Dibuka", style: kFontHeaderStyle),
                        const ReusableContainerWidget(child: PengajuanWidget()),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        Text("Renego", style: kFontHeaderStyle),
                        const ReusableContainerWidget(child: RenegoWidget()),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        Text("Approve", style: kFontHeaderStyle),
                        const ReusableContainerWidget(child: ApproveWidget()),
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
                        Text("Nasabah Valid", style: kFontHeaderStyle),
                        const ReusableContainerWidget(
                            child: ValidNasabahWidget()),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        Text("Mitranet Valid", style: kFontHeaderStyle),
                        const ReusableContainerWidget(
                            child: ValidMitranetWidget()),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                          indent: kDefaultPadding * 5,
                          endIndent: kDefaultPadding * 5,
                        ),
                        Text("Black List", style: kFontHeaderStyle),
                        const ReusableContainerWidget(child: BlackListWidget()),
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
