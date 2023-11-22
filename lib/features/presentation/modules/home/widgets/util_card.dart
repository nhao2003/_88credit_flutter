import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../../config/theme/app_color.dart';

class UtilCard extends StatelessWidget {
  const UtilCard(
      {required this.title,
      required this.image,
      required this.onTap,
      super.key});

  final String title;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ZoomTapAnimation(
          child: InkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Container(
              width: 17.wp,
              height: 17.wp,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: AppColors.grey200,
                ),
              ),
              child: Image.asset(
                image,
                width: 25,
                height: 25,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: AppTextStyles.regular12,
        ),
      ],
    );
  }
}
