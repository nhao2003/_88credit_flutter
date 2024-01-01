import 'package:get/get.dart';
import 'bank_controller.dart';

class BankBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankController>(() => BankController());
  }
}
