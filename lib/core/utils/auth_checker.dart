import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../features/bottom_nav_bar/presentation/pages/bottom_nav_bar_page.dart';
import '../../injection_container.dart';

class AuthCheckerController extends GetxController {
  static AuthCheckerController instance = Get.find();
  Rx<User?>? firebaseUser;

  @override
  void onReady() {
    super.onReady();

    firebaseAuth.idTokenChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
        Get.offAll(() => const BottomNavBarPage());
        return;
      } else {
        debugPrint('User is signed in!');
        Get.offAll(() => const BottomNavBarPage());
        return;
      }
    });
  }

  void signOut() async {
    firebaseAuth.signOut();
  }
}
