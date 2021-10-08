import 'package:get/get.dart';

import '../../injection_container.dart';

class RestFirestoreController extends GetxController {
  static RestFirestoreController instance = Get.find();

  Future<bool> updateReturnBool(
      {required String? collection,
      required String? handle,
      required Map<String, dynamic>? data}) async {
    try {
      await firebaseFirestore.collection(collection!).doc(handle).update(data!);
    } catch (e) {
      return false;
    }
    return true;
  }
}
