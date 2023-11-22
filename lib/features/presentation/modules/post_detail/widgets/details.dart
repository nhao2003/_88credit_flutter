import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';

import '../../../../../config/theme/text_styles.dart';

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.title,
    required this.value,
    required this.iconAsset,
    this.icon,
  });

  final String title;
  final String value;
  final String iconAsset;
  final IoniconsData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon == null
            ? Image.asset(
                iconAsset,
                width: 24,
              )
            : Icon(
                icon,
                size: 24,
              ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.medium12.colorEx(AppColors.grey500),
              maxLines: 2,
            ),
            Text(
              value,
              style: AppTextStyles.medium12.colorEx(AppColors.black),
              maxLines: 2,
            ),
          ],
        ),
      ],
    );
  }
}
