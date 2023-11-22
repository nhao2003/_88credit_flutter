import 'package:flutter/material.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';

class CharacterBox extends StatelessWidget {
  const CharacterBox({required this.title, required this.child, super.key});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.8),
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
              child: child,
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            child: Center(
              child: Text(
                title,
                style: AppTextStyles.regular12.copyWith(fontSize: 11),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
