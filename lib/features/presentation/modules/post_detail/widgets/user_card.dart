import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../../config/values/asset_image.dart';

class UserCard extends StatelessWidget {
  final int? numOfStars;
  final String? avatar;
  final String name;
  final RxBool isLiked;
  final Function() onLike;
  final Function()? onContact;
  final Function()? navToUserProfile;

  const UserCard(
      {this.numOfStars,
      this.avatar,
      required this.name,
      required this.isLiked,
      required this.onLike,
      this.navToUserProfile,
      this.onContact,
      super.key});

  Widget _buildStars() {
    return Row(
      children: List.generate(
        5,
        (index) => Image.asset(
          Assets.star,
          width: 14,
          height: 14,
          color: index < numOfStars! ? AppColors.yellow : AppColors.grey200,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
// user
          InkWell(
            onTap: navToUserProfile,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Avatar
                if (avatar != null)
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: CachedNetworkImage(
                      imageUrl: avatar!,
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
                // name and stars
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.semiBold14.colorEx(AppColors.black),
                    ),
                    const SizedBox(height: 4),
                    _buildStars(),
                  ],
                ),
              ],
            ),
          ),
// Lien he and luu
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
// Lien he
              InkWell(
                onTap: onContact,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.greenLight,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Liên hệ",
                    style: AppTextStyles.semiBold12.colorEx(
                      AppColors.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
// name and stars
              SizedBox(
                height: 20,
                child: Obx(
                  () => IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Icon(
                      isLiked.value
                          ? Icons.bookmark
                          : Icons.bookmark_border_outlined,
                      size: 25,
                    ),
                    color: isLiked.value ? AppColors.yellow : AppColors.grey400,
                    onPressed: () {
                      onLike();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
