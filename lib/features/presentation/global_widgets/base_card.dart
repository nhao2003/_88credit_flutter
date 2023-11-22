import 'package:flutter/material.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import '../../../config/theme/app_color.dart';
import '../../../config/theme/text_styles.dart';

class BaseCard extends StatelessWidget {
  const BaseCard(
      {required this.title,
      required this.isvisible,
      required this.child,
      super.key});

  final bool isvisible;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisible,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.bold14.colorEx(Colors.black),
            ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}
