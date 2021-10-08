import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../injection_container.dart';
import '../../../prospect/domain/entities/prospect.dart';
import '../../domain/entities/page_hook.dart';

class TenLastDataController extends GetxController {
  static TenLastDataController instance = Get.find();

  Future route(PageHook hook) async {
    switch (hook.section) {
      case SectionHook.latest:
        if (hook.stage == 'pengajuan') {
          return await _dataLatestUnread(hook.stage);
        }
        return await _dataLatest(hook.stage);
      case SectionHook.history:
        return await _dataHistory();
      case SectionHook.read:
        return await _dataRead(hook.stage);
      case SectionHook.approve:
        return await _dataLatest(hook.stage);
      case SectionHook.renegosiasi:
        return await _dataLatest(hook.stage);
      case SectionHook.blackList:
        return await _dataLatest(hook.stage);
      default:
        return [];
    }
  }

  Future<List<Prospect>> _dataRead(String stage) async {
    List<Prospect> list = [];

    try {
      final data = await firebaseFirestore
          .collection(Prospect.modelName)
          .where('stageHook', isEqualTo: stage)
          .where('isRead', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(10)
          .get();
      if (data.size > 0) {
        for (var element in data.docs) {
          list.add(Prospect.fromMap(element.data()));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return list;
  }

  Future<List<Prospect>> _dataHistory() async {
    List<Prospect> list = [];

    try {
      final data = await firebaseFirestore
          .collection("DataLog")
          .orderBy('createdAt', descending: true)
          .limit(10)
          .get();
      if (data.size > 0) {
        for (var element in data.docs) {
          list.add(Prospect.fromMap(element.data()));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return list;
  }

  Future<List<Prospect>> _dataLatestUnread(String stage) async {
    List<Prospect> list = [];

    try {
      final data = await firebaseFirestore
          .collection(Prospect.modelName)
          .where('stageHook', isEqualTo: stage)
          .where('isRead', isEqualTo: false)
          .orderBy('createdAt', descending: false)
          .limit(10)
          .get();

      if (data.size > 0) {
        for (var element in data.docs) {
          list.add(Prospect.fromMap(element.data()));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return list;
  }

  Future<List<Prospect>> _dataLatest(String stage) async {
    List<Prospect> list = [];

    try {
      final data = await firebaseFirestore
          .collection(Prospect.modelName)
          .where('stageHook', isEqualTo: stage)
          .orderBy('createdAt', descending: false)
          .limit(10)
          .get();

      if (data.size > 0) {
        for (var element in data.docs) {
          list.add(Prospect.fromMap(element.data()));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return list;
  }
}
