import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/date_ex.dart';
import 'package:_88credit_flutter/features/domain/entities/posts/real_estate_post.dart';
import 'package:_88credit_flutter/features/domain/enums/post_status_management.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../post_management_controller.dart';
import 'item_post.dart';

class ListPostsExpried extends StatelessWidget {
  ListPostsExpried({super.key});
  final PostManagementController controller =
      Get.find<PostManagementController>();

  void onSelectedMenu(int i, RealEstatePostEntity post) {
    if (i == 0) {
      controller.deletePost(post);
    } else if (i == 1) {
      controller.extensionPost(post);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RealEstatePostEntity>>(
      future: controller.getPostsExpired(),
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
                "Chưa có tin hết hạn",
                style: AppTextStyles.bold20.copyWith(color: AppColors.green),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.expiredPosts.length,
              itemBuilder: (context, index) {
                return ItemPost(
                  statusCode: PostStatusManagement.exprired,
                  status:
                      "Tin đã hết hạn từ ${controller.expiredPosts[index].expiryDate?.toHMDMYString()}",
                  post: controller.expiredPosts[index],
                  funcs: const [
                    "Xóa tin",
                    "Gia hạn",
                  ],
                  iconFuncs: const [
                    Icons.delete_outline,
                    Icons.timer_outlined,
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
