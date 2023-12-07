import 'package:_88credit_flutter/features/presentation/modules/post/post_controler.dart';
import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/presentation/modules/post/widgets/card_sort.dart';
import 'package:get/get.dart';
import '../widgets/post_borrow_card.dart';

class BorrowTabScreen extends StatelessWidget {
  BorrowTabScreen({super.key});
  final PostController controller = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const CardSort(),
              const SizedBox(height: 20),
              PostBorrowCard(post: controller.getPostBorrowing()),
              const SizedBox(height: 20),
              PostBorrowCard(post: controller.getPostBorrowing()),
              const SizedBox(height: 20),
              PostBorrowCard(post: controller.getPostBorrowing()),
            ],
          ),
        ),
      ),
    );
  }
}
