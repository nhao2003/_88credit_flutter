import 'package:get/get.dart';
import 'package:_88credit_flutter/features/presentation/modules/blogs/blog_controller.dart';

class BlogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogController>(() => BlogController());
  }
}
