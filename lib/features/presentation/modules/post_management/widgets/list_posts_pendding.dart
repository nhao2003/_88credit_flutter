import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../domain/entities/posts/real_estate_post.dart';
import '../../../../domain/enums/post_status_management.dart';
import '../post_management_controller.dart';
import 'item_post.dart';

class ListPostsPendding extends StatelessWidget {
  ListPostsPendding({super.key});
  final PostManagementController controller =
      Get.find<PostManagementController>();

  void onSelectedMenu(int i, RealEstatePostEntity post) {
    if (i == 0) {
      controller.editPost(post);
    } else if (i == 1) {
      controller.deletePost(post);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RealEstatePostEntity>>(
      future: controller.getPostsPending(),
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
                "Chưa có tin đang chờ duyệt",
                style: AppTextStyles.bold20.copyWith(color: AppColors.green),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.pendingPosts.length,
              itemBuilder: (context, index) {
                return ItemPost(
                  statusCode: PostStatusManagement.pending,
                  status: "Chờ duyệt",
                  post: controller.pendingPosts[index],
                  funcs: const [
                    "Chỉnh sửa",
                    "Xóa tin",
                  ],
                  iconFuncs: const [
                    Icons.edit,
                    Icons.delete_outline,
                  ],
                  onSelectedMenu: onSelectedMenu,
                  onTap: (RealEstatePostEntity post) {},
                );
              },
            );
          }
        }
      },
    );
  }
}
