import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'core/utils/auth_checker.dart';
import 'features/bottom_nav_bar/presentation/controllers/bottom_nav_bar_controller.dart';
import 'features/home/presentation/controllers/ten_last_data_controller.dart';

//! global variable
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

TenLastDataController tenLastDataController = TenLastDataController.instance;
BottomNavBarController bottomNavBarController = BottomNavBarController.instance;
AuthCheckerController authCheckerController = AuthCheckerController.instance;

Future<void> init() async {
  await Firebase.initializeApp();

  //! controller init
  Get.put(TenLastDataController());
  Get.put(BottomNavBarController());
  Get.put(AuthCheckerController());
}
