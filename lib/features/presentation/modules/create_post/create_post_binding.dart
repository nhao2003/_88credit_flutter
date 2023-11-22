import 'package:get/get.dart';
import 'create_post_controller.dart';

class CreatePostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePostController>(() => CreatePostController());
  }
}
