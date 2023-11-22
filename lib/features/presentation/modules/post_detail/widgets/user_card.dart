import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../../config/values/asset_image.dart';
import '../post_detail_controller.dart';

class UserCard extends StatelessWidget {
  UserCard({super.key});

  final PostDetailController controller = Get.find<PostDetailController>();

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
              if (controller.post.user!.avatar != null)
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: controller.post.user!.avatar!,
                    fit: BoxFit.cover,
                    width: 50,
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
                    "${controller.post.user!.firstName!} ${controller.post.user!.lastName}",
                    //"Phan Văn Minh",
                    style: AppTextStyles.semiBold14.colorEx(
                      AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    controller.post.isProSeller! ? "Cá nhân" : "Môi giới",
                    style: AppTextStyles.regular14.colorEx(
                      AppColors.grey700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              controller.navToUserProfile();
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
              "Xem hồ sơ",
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
