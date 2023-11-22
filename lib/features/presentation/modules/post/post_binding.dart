import 'package:get/get.dart';

import 'post_controler.dart';

class PostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>(() => PostController());
  }
}
