import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../../config/theme/app_color.dart';

class BorderImageButton extends StatelessWidget {
  const BorderImageButton(
      {required this.title,
      required this.image,
      required this.onTap,
      super.key});

  final String title;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: AppColors.grey200,
          ),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            onTap: onTap,
            child: Container(
              width: 43.wp,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Image.asset(
                    image,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
