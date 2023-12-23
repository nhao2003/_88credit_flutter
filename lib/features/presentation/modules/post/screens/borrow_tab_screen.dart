import 'package:_88credit_flutter/features/presentation/modules/post/post_controler.dart';
import 'package:_88credit_flutter/features/presentation/modules/post/widgets/card_sort.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/entities/credit/post.dart';
import '../../../global_widgets/base_list_posts.dart';
import '../widgets/post_borrow_card.dart';

class BorrowTabScreen extends StatelessWidget {
  BorrowTabScreen({super.key});
  final PostController controller = Get.find<PostController>();

  Widget? buildItem(PostEntity post) {
    return PostBorrowCard(post: post);
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
        getPosts: controller.getPostsBorrowing,
        postsList: controller.borrowingPosts,
        buildItem: buildItem,
      ),
    );
  }
}
