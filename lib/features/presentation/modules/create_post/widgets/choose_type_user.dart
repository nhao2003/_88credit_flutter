import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../create_post_controller.dart';

class ChooseTypeUserCard extends StatelessWidget {
  ChooseTypeUserCard({super.key});
  final CreatePostController controller = Get.find<CreatePostController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.setRole(true);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: controller.isProSeller.value == true
                        ? AppColors.greenLight
                        : AppColors.grey200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Cá nhân",
                    style: AppTextStyles.medium14.copyWith(
                      color: controller.isProSeller.value == true
                          ? AppColors.green
                          : AppColors.grey600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.setRole(false);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: controller.isProSeller.value != true
                        ? AppColors.greenLight
                        : AppColors.grey200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Môi giới",
                    style: AppTextStyles.medium14.copyWith(
                      color: controller.isProSeller.value != true
                          ? AppColors.green
                          : AppColors.grey600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
