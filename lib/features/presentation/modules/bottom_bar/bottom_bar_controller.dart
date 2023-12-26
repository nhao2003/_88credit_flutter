import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/routes/app_routes.dart';

class BottomBarController extends GetxController {
  int tabIndex = 0;
  late TabController tabController;
  void changeTabIndex(int index) async {
    if (index == 2) {
      Get.toNamed(AppRoutes.createPost);
    } else {
      tabIndex = index;
      tabController.index = index;
    }
    update();
  }
}
