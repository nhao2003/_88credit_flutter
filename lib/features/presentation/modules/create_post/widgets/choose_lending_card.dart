import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../create_post_controller.dart';

class ChooseLendingCard extends StatelessWidget {
  ChooseLendingCard({super.key});

  final CreatePostController controller = Get.find<CreatePostController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.setIsLending(false);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: controller.isLending.value != true
                    ? AppColors.greenLight
                    : AppColors.grey200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Vay tiền",
                style: AppTextStyles.medium14.copyWith(
                  color: controller.isLending.value != true
                      ? AppColors.green
                      : AppColors.grey600,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              controller.setIsLending(true);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: controller.isLending.value == true
                    ? AppColors.greenLight
                    : AppColors.grey200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Cho vay",
                style: AppTextStyles.medium14.copyWith(
                  color: controller.isLending.value == true
                      ? AppColors.green
                      : AppColors.grey600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
