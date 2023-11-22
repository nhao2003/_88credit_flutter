import 'package:flutter/material.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({
    required this.title,
    required this.icon,
    required this.type,
    super.key,
  });

  final String title;
  final String icon;
  final bool type;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: type ? AppColors.green : AppColors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        textStyle: const TextStyle(color: AppColors.white),
        elevation: 0,
        minimumSize: Size(28.wp, 25),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: AppColors.green,
              width: 1,
            )),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: AppTextStyles.medium14
                .colorEx(type ? AppColors.white : AppColors.green),
          ),
        ],
      ),
    );
  }
}
