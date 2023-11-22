import 'package:get/get.dart';
import 'post_detail_controller.dart';

class PostDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostDetailController>(() => PostDetailController());
  }
}
