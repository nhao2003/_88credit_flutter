import 'package:get/get.dart';

import 'base_controler.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
  }
}
