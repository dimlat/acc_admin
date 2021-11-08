import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../features/home/presentation/pages/home_page.dart';
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
        Get.offAll(
          () => const HomePage(), // BottomNavBarPage(),
        );
        return;
      } else {
        debugPrint('User is signed in!');
        Get.offAll(
          () => const HomePage(), //BottomNavBarPage(),
        );
        return;
      }
    });
  }

  void signOut() async {
    firebaseAuth.signOut();
  }
}
