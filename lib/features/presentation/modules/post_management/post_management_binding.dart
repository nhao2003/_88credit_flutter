import 'package:get/get.dart';
import 'post_management_controller.dart';

class PostManagementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostManagementController>(() => PostManagementController());
  }
}
