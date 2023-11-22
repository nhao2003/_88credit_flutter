import 'package:flutter/material.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import '../../../config/theme/app_color.dart';
import '../../../config/theme/text_styles.dart';

class NotIdentityCard extends StatelessWidget {
  const NotIdentityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed(Routes.IDENTITY);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Chưa xác thực",
              style: AppTextStyles.medium12.colorEx(AppColors.grey700),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
