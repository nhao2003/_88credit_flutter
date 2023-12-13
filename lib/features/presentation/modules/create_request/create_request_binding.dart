import 'package:get/get.dart';
import 'create_request_controler.dart';

class CreateRequestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateRequestController>(() => CreateRequestController());
  }
}
