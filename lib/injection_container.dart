import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'core/utils/auth_checker.dart';
import 'features/bottom_nav_bar/presentation/controllers/bottom_nav_bar_controller.dart';


//! global variable
FirebaseAuth firebaseAuth = FirebaseAuth.instance;

BottomNavBarController bottomNavBarController = BottomNavBarController.instance;
AuthCheckerController authCheckerController = AuthCheckerController.instance;

Future<void> init() async {
  await Firebase.initializeApp();

  //! controller init
  Get.put(BottomNavBarController());
  Get.put(AuthCheckerController());
}
