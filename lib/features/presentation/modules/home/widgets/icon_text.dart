import 'package:flutter/material.dart';

import '../../../../../config/theme/text_styles.dart';

class IconText extends StatelessWidget {
  const IconText({
    required this.icon,
    required this.text,
    required this.color,
    super.key,
  });

  final String icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 15,
          height: 15,
        ),
        const SizedBox(width: 4),
        SizedBox(
          width: 145,
          child: Text(
            text,
            maxLines: 1,
            style: AppTextStyles.medium12.copyWith(color: color),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
