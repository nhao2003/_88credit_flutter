import 'package:get/get.dart';
import 'contract_controler.dart';

class ContractBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContractController>(() => ContractController());
  }
}
