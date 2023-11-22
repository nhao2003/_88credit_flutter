import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_tabbar.dart';

class LoadLimitCard extends StatelessWidget {
  LoadLimitCard({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: AppColors.grey200,
        ),
      ),
      child: Column(
        children: [
          Obx(() => Text(
                controller.currentIndexTab.value == 0
                    ? "Hạn mức vay tối đa"
                    : "Hạn mức cho vay tối đa",
                style: AppTextStyles.medium16,
              )),
          const SizedBox(height: 5),
          Obx(
            () => Text(
              controller.currentIndexTab.value == 0
                  ? "${controller.lendLimit} VNĐ"
                  : "${controller.borrowLimit} VNĐ",
              style: AppTextStyles.bold30.colorEx(AppColors.green),
            ),
          ),
          const SizedBox(height: 10),
          const MyTabbar(),
        ],
      ),
    );
  }
}
