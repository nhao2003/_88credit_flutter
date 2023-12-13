import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/values/asset_image.dart';
import 'spash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.find();
    controller.checkLogin();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Đặt căn giữa theo chiều dọc
          mainAxisSize:
              MainAxisSize.min, // Chỉ mở rộng theo chiều dọc nếu cần thiết
          children: [
            Image.asset(Assets.appLogoLight),
            const SizedBox(
                height: 16), // Khoảng cách giữa hình ảnh và vòng tròn
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
