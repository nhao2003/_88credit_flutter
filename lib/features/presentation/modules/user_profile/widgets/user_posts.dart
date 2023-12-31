import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/presentation/modules/user_profile/user_profile_controller.dart';
import '../../../../domain/entities/credit/post.dart';
import '../../../global_widgets/base_list_posts.dart';
import '../../post/widgets/post_borrow_card.dart';

class UserPosts extends StatelessWidget {
  UserPosts({super.key});
  final UserProfileController controller = UserProfileController();

  Widget? buildItem(PostEntity post) {
    return PostBorrowCard(post: post);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: BaseListPosts(
        getPosts: controller.getAllPosts,
        postsList: controller.userPosts,
        buildItem: buildItem,
      ),
    );
  }
}
