import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../config/theme/app_color.dart';
import '../../../../../../config/theme/text_styles.dart';
import '../../../../../../config/values/asset_image.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    this.avatar,
    this.buttonText,
    required this.title,
    required this.name,
    required this.navToProfile,
    super.key,
  });

  final String? avatar;
  final String title;
  final String name;
  final Function navToProfile;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // avatar
              if (avatar != null)
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: CachedNetworkImage(
                    imageUrl: Uri.parse(avatar!).toString(),
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                    errorWidget: (context, _, __) {
                      return const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(Assets.avatar2),
                      );
                    },
                  ),
                )
              else
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(Assets.avatar2),
                ),
              const SizedBox(width: 10),
              // Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.regular14.colorEx(
                      AppColors.grey700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    name,
                    style: AppTextStyles.semiBold14.colorEx(
                      AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              navToProfile();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              textStyle: const TextStyle(color: AppColors.white),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    color: AppColors.green,
                    width: 1,
                  )),
            ),
            child: Text(
              buttonText ?? "Xem hồ sơ",
              style: AppTextStyles.medium14.colorEx(
                AppColors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
