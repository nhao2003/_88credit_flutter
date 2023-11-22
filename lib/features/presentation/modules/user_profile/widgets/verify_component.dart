import 'package:flutter/material.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';

import '../../../../../config/values/asset_image.dart';

class VerifyComponent extends StatelessWidget {
  const VerifyComponent({
    required this.isVerify,
    required this.isMe,
    super.key,
  });

  final bool isVerify;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return isVerify
        ? Image.asset(
            Assets.badge,
            width: 20,
            height: 20,
          )
        : isMe
            ? InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Chưa xác thực",
                        style:
                            AppTextStyles.medium12.colorEx(AppColors.grey700),
                      ),
                      const SizedBox(width: 2),
                      const Icon(Icons.arrow_forward_ios,
                          size: 10, color: AppColors.grey700)
                    ],
                  ),
                ),
              )
            : const SizedBox();
  }
}
