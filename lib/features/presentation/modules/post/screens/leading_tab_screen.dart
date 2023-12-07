import 'package:_88credit_flutter/features/presentation/modules/post/widgets/card_sort.dart';
import 'package:_88credit_flutter/features/presentation/modules/post/widgets/post_lending_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../post_controler.dart';

class LendingTabScreen extends StatelessWidget {
  LendingTabScreen({super.key});
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
              PostLendingCard(post: controller.getPostLending()),
              const SizedBox(height: 20),
              PostLendingCard(post: controller.getPostLending()),
              const SizedBox(height: 20),
              PostLendingCard(post: controller.getPostLending()),
            ],
          ),
        ),
      ),
    );
  }
}
