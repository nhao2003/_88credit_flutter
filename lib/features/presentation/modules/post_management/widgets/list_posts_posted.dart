import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/entities/credit/post.dart';
import '../../../../domain/enums/post_status_management.dart';
import '../post_management_controller.dart';
import '../../../global_widgets/base_list_posts.dart';
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

  ItemPost buildItem(PostEntity post) {
    return ItemPost(
      statusCode: PostStatusManagement.approved,
      status: "Đã được duyệt",
      post: post,
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
      onTap: controller.navigationToPostDetail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseListPosts(
      titleNull: "Chưa có tin đã đăng",
      getPosts: controller.getPostsApproved,
      postsList: controller.approvedPosts,
      buildItem: buildItem,
    );
  }
}
