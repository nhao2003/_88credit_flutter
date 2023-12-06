import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../domain/entities/credit/post.dart';
import '../../../../domain/enums/post_status_management.dart';
import '../post_management_controller.dart';
import 'item_post.dart';

class ListPostsPosted extends StatelessWidget {
  ListPostsPosted({super.key});
  final PostManagementController controller =
      Get.find<PostManagementController>();

  void onSelectedMenu(int i, PostEntity post) {
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
    return FutureBuilder<List<PostEntity>>(
      future: controller.getPostsApproved(),
      builder: (context, snapShot) {
        if (!snapShot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<PostEntity> data = snapShot.data!;
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
                  status: "Đã được duyệt",
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
