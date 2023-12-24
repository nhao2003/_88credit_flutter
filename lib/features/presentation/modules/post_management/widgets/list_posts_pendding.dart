import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/entities/credit/post.dart';
import '../../../../domain/enums/post_status_management.dart';
import '../post_management_controller.dart';
import '../../../global_widgets/base_list_posts.dart';
import 'item_post.dart';

class ListPostsPendding extends StatelessWidget {
  ListPostsPendding({super.key});
  final PostManagementController controller =
      Get.find<PostManagementController>();

  void onSelectedMenu(int i, PostEntity post) {
    if (i == 0) {
      controller.editPost(post);
    } else if (i == 1) {
      controller.deletePost(post);
    }
  }

  ItemPost buildItem(PostEntity post) {
    return ItemPost(
      statusCode: PostStatusManagement.pending,
      status: "Chờ duyệt",
      post: post,
      funcs: const [
        "Chỉnh sửa",
        "Xóa tin",
      ],
      iconFuncs: const [
        Icons.edit,
        Icons.delete_outline,
      ],
      onSelectedMenu: onSelectedMenu,
      onTap: controller.navigationToPostDetail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseListPosts(
      titleNull: "Chưa có tin đang chờ duyệt",
      getPosts: controller.getPostsPending,
      postsList: controller.pendingPosts,
      buildItem: buildItem,
    );
  }
}
