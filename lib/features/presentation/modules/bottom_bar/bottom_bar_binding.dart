import 'package:_88credit_flutter/features/presentation/modules/contract/contract_controler.dart';
import 'package:_88credit_flutter/features/presentation/modules/post/post_controler.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/features/presentation/modules/account/account_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/create_post_controller.dart';
import '../home/home_controller.dart';
import 'bottom_bar_controller.dart';

class BottomBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(() => BottomBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<PostController>(() => PostController());
    Get.lazyPut<CreatePostController>(() => CreatePostController());
    Get.lazyPut<ContractController>(() => ContractController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
