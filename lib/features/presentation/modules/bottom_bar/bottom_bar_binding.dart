import 'package:get/get.dart';
import 'package:_88credit_flutter/features/presentation/modules/account/account_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/create_post_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/notification/notification_controller.dart';
import '../home/home_controller.dart';
import '../post_management/post_management_controller.dart';
import 'bottom_bar_controller.dart';

class BottomBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(() => BottomBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<PostManagementController>(() => PostManagementController());
    Get.lazyPut<CreatePostController>(() => CreatePostController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
