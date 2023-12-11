import 'package:get/get.dart';
import 'base_controler.dart';

class CreateRequestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateRequestController>(() => CreateRequestController());
  }
}
