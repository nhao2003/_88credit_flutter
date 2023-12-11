import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:flutter/material.dart';
import '../../../config/theme/app_color.dart';
import '../../../config/theme/text_styles.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    required this.title,
    this.paddingLeft,
    super.key,
  });

  final String title;
  final double? paddingLeft;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: paddingLeft ?? 10),
          child: Text(
            title,
            style: AppTextStyles.bold14.colorEx(AppColors.black),
          ),
        ),
      ],
    );
  }
}
