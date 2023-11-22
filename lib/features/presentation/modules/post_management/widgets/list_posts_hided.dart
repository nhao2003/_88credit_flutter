import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/date_ex.dart';
import 'package:_88credit_flutter/features/domain/enums/post_status_management.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../domain/entities/posts/real_estate_post.dart';
import '../post_management_controller.dart';
import 'item_post.dart';

class ListPostsHided extends StatelessWidget {
  ListPostsHided({super.key});
  final PostManagementController controller =
      Get.find<PostManagementController>();

  void onSelectedMenu(int i, RealEstatePostEntity post) {
    if (i == 0) {
      controller.showPost(post);
    } else if (i == 1) {
      controller.editPost(post);
    } else if (i == 2) {
      controller.deletePost(post);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RealEstatePostEntity>>(
      future: controller.getPostsHided(),
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
                "Chưa có tin đã ẩn",
                style: AppTextStyles.bold20.copyWith(color: AppColors.green),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.hidedPosts.length,
              itemBuilder: (context, index) {
                return ItemPost(
                  statusCode: PostStatusManagement.hided,
                  status:
                      "Đã ẩn tin. Hết hạn sau ${controller.hidedPosts[index].expiryDate?.toHMDMYString()}",
                  post: controller.hidedPosts[index],
                  funcs: const [
                    "Hiện tin",
                    "Chỉnh sửa",
                    "Xóa tin",
                  ],
                  iconFuncs: const [
                    Icons.remove_red_eye_outlined,
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
