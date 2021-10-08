import 'package:get/get.dart';

import '../../../../../injection_container.dart';
import '../../../../prospect/domain/entities/prospect.dart';

class ProspectController extends GetxController {
  static ProspectController instance = Get.find();

  Future<bool> updateStageHook(docId, stage) async {
    await firebaseFirestore
        .collection(Prospect.modelName)
        .doc(docId)
        .update({"stageHook": stage});
    return true;
  }
}
