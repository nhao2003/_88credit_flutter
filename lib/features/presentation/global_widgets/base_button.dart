import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_color.dart';
import '../../../config/theme/text_styles.dart';

class BaseButton extends StatelessWidget {
  const BaseButton(
      {required this.title,
      this.isLoading,
      this.colorButton,
      this.colorText,
      this.width,
      required this.onClick,
      super.key});

  final RxBool? isLoading;
  final Color? colorButton;
  final Color? colorText;
  final String title;
  final Function onClick;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: isLoading!.value
            ? null
            : () {
                onClick();
                //Get.toNamed(AppRoutes.bottomBar);
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton ?? AppColors.green,
          padding: const EdgeInsets.symmetric(vertical: 15),
          textStyle: const TextStyle(color: AppColors.white),
          elevation: 10,
          minimumSize: Size(width ?? 100.wp, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isLoading!.value
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ))
            : Text(
                title,
                style:
                    AppTextStyles.bold14.colorEx(colorText ?? AppColors.white),
              ),
      ),
    );
  }
}
