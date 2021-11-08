import 'package:get/get.dart';

import 'page_name_static_class.dart';


class PageController extends GetxController {
  static PageController instance = Get.find();
  RxString subPageShow = PageNameStaticClass.home.obs; // default Home
}
