import 'package:flutter/material.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import '../../../../../config/values/asset_image.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.appLogoSologan,
            width: 70.wp,
          ),
        ],
      ),
    );
  }
}
