import 'package:_88credit_flutter/core/extensions/date_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/user_profile/screens/dialog_report.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/user_profile/user_profile_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/user_profile/widgets/button_follow.dart';
import 'package:_88credit_flutter/features/presentation/modules/user_profile/widgets/tab_profile.dart';
import 'package:_88credit_flutter/features/presentation/modules/user_profile/widgets/verify_component.dart';
import 'package:get/get.dart';
import '../../../../../config/values/asset_image.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final UserProfileController controller = UserProfileController();

  @override
  void initState() {
    controller.checkIsMe();
    super.initState();
  }

  void showCommentForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => DialogReport(
        user: controller.user!,
        handleReportUser: controller.handleReportUser,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double sizeImage = 22.wp;
    return Scaffold(
      appBar: MyAppbar(
        title: controller.user!.fullName,
        actions: [
          controller.isMe.value
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      showCommentForm(context);
                    },
                    icon: const Icon(
                      Icons.outlined_flag_rounded,
                      color: AppColors.grey500,
                    ),
                  ),
                ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //avatar ========================================
                    if (controller.user!.avatar != null)
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: CachedNetworkImage(
                          imageUrl: controller.user!.avatar!,
                          fit: BoxFit.cover,
                          width: sizeImage,
                          height: sizeImage,
                          errorWidget: (context, _, __) {
                            return CircleAvatar(
                              radius: sizeImage / 2,
                              backgroundImage: const AssetImage(Assets.avatar2),
                            );
                          },
                        ),
                      )
                    else
                      CircleAvatar(
                        radius: sizeImage / 2,
                        backgroundImage: const AssetImage(Assets.avatar2),
                      ),
                    const SizedBox(width: 10),
                    // info ========================================
                    Expanded(
                      child: Column(
                        children: [
                          // info
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Bai viet
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.numberPost.toString(),
                                      style: AppTextStyles.semiBold16
                                          .colorEx(AppColors.grey700),
                                    ),
                                    Text(
                                      "Bài viết",
                                      style: AppTextStyles.medium12
                                          .colorEx(AppColors.grey700),
                                    ),
                                  ],
                                ),
                                // Người theo dõi
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.numberFollower.toString(),
                                      style: AppTextStyles.semiBold16
                                          .colorEx(AppColors.grey700),
                                    ),
                                    Text(
                                      "Người theo dõi",
                                      style: AppTextStyles.medium12
                                          .colorEx(AppColors.grey700),
                                    ),
                                  ],
                                ),
                                // Đang theo dõi
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.numberFollowing.toString(),
                                      style: AppTextStyles.semiBold16
                                          .colorEx(AppColors.grey700),
                                    ),
                                    Text(
                                      "Đang theo dõi",
                                      style: AppTextStyles.medium12
                                          .colorEx(AppColors.grey700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          // button follow
                          Obx(
                            () => ButtonFollow(
                              isFollow: controller.isFollow.value,
                              isMe: controller.isMe.value,
                              onTap: controller.toggleIsFollow,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                // name ============================================
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      controller.user!.fullName,
                      style:
                          AppTextStyles.semiBold16.colorEx(AppColors.grey700),
                    ),
                    const SizedBox(width: 5),
                    const VerifyComponent(isVerify: true, isMe: true),
                  ],
                ),
                // location ========================================
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.location,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 80.wp,
                      child: Text(
                        controller.user!.address!.getDetailAddress(),
                        style:
                            AppTextStyles.medium14.colorEx(AppColors.grey500),
                      ),
                    )
                  ],
                ),
                // dateCreate ======================================
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.calendar,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 80.wp,
                      child: Text(
                        "Tham gia ngày ${(controller.user!.createdAt!.toDMYString())}",
                        style:
                            AppTextStyles.medium14.colorEx(AppColors.grey500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          // tab ==============================================
          const TabProfile(),
        ],
      ),
      floatingActionButton: Obx(
        () => controller.isMe.value
            ? Container()
            : FloatingActionButton.extended(
                onPressed: () {
                  controller.navToCreateRequest();
                },
                backgroundColor: AppColors.green,
                extendedPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                label: Text(
                  "Tạo yêu cầu",
                  style: AppTextStyles.bold12.colorEx(
                    AppColors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
