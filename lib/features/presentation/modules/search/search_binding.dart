import 'package:get/get.dart';
import 'search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySearchController>(() => MySearchController());
  }
}
