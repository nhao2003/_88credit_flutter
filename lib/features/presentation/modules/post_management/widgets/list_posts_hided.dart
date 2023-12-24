import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/features/domain/enums/post_status_management.dart';
import '../../../../domain/entities/credit/post.dart';
import '../post_management_controller.dart';
import '../../../global_widgets/base_list_posts.dart';
import 'item_post.dart';

class ListPostsHided extends StatelessWidget {
  ListPostsHided({super.key});
  final PostManagementController controller =
      Get.find<PostManagementController>();

  void onSelectedMenu(int i, PostEntity post) {
    if (i == 0) {
      controller.showPost(post);
    } else if (i == 1) {
      controller.editPost(post);
    } else if (i == 2) {
      controller.deletePost(post);
    }
  }

  ItemPost buildItem(PostEntity post) {
    return ItemPost(
      statusCode: PostStatusManagement.hided,
      status: "Đã ẩn tin",
      post: post,
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
      onTap: controller.navigationToPostDetail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseListPosts(
      titleNull: "Chưa có tin đã ẩn",
      getPosts: controller.getPostsHided,
      postsList: controller.hidedPosts,
      buildItem: buildItem,
    );
  }
}
