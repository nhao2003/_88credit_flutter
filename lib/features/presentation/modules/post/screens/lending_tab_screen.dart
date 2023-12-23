import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/base_list_posts.dart';
import 'package:_88credit_flutter/features/presentation/modules/post/widgets/post_lending_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../post_controler.dart';
import '../widgets/card_sort.dart';

class LendingTabScreen extends StatelessWidget {
  LendingTabScreen({super.key});
  final PostController controller = Get.find<PostController>();

  Widget? buildItem(PostEntity post) {
    return PostLendingCard(post: post);
  }

  Widget? buildCardSort() {
    return const CardSort();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: BaseListPosts(
        cardSort: buildCardSort(),
        getPosts: controller.getPostsLending,
        postsList: controller.lendingPosts,
        buildItem: buildItem,
      ),
    );
  }
}
