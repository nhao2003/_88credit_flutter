import 'package:get/get.dart';
import 'purchase_controller.dart';

class PurchaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseController>(() => PurchaseController());
  }
}
