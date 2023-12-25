import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final double? widthTitle;

  const InfoRow(
      {required this.title, required this.value, this.widthTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widthTitle ?? 80,
          child: Text(
            title,
            style: AppTextStyles.medium12.colorEx(AppColors.black),
          ),
        ),
        const SizedBox(width: 2),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bold12.colorEx(AppColors.black),
          ),
        ),
      ],
    );
  }
}
