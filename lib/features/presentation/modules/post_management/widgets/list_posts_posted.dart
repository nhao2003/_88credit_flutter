import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/date_ex.dart';
import 'package:_88credit_flutter/features/domain/entities/posts/real_estate_post.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../domain/enums/post_status_management.dart';
import '../post_management_controller.dart';
import 'item_post.dart';

class ListPostsPosted extends StatelessWidget {
  ListPostsPosted({super.key});
  final PostManagementController controller =
      Get.find<PostManagementController>();

  void onSelectedMenu(int i, RealEstatePostEntity post) {
    if (i == 0) {
      controller.hidePost(post);
    } else if (i == 1) {
      controller.editPost(post);
    } else if (i == 2) {
      controller.deletePost(post);
    } else if (i == 3) {
      controller.extensionPost(post);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RealEstatePostEntity>>(
      future: controller.getPostsApproved(),
      builder: (context, snapShot) {
        if (!snapShot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<RealEstatePostEntity> data = snapShot.data!;
          if (data.isEmpty) {
            return Center(
              child: Text(
                "Chưa có tin đã đăng",
                style: AppTextStyles.bold20.copyWith(color: AppColors.green),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.approvedPosts.length,
              itemBuilder: (context, index) {
                return ItemPost(
                  statusCode: PostStatusManagement.approved,
                  status:
                      "Hiển thị đến ${controller.approvedPosts[index].expiryDate?.toHMDMYString()}",
                  post: controller.approvedPosts[index],
                  funcs: const [
                    "Ẩn tin",
                    "Chỉnh sửa",
                    "Xóa tin",
                    "Gia hạn",
                  ],
                  iconFuncs: const [
                    Icons.remove_red_eye_outlined,
                    Icons.edit,
                    Icons.delete_outline,
                    Icons.timer_outlined,
                  ],
                  onSelectedMenu: onSelectedMenu,
                  onTap: controller.navigateToDetailSceen,
                );
              },
            );
          }
        }
      },
    );
  }
}
