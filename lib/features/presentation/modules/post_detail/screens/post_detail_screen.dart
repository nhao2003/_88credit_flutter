import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/post_detail/post_detail_controller.dart';

class PostDetailScreen extends StatelessWidget {
  PostDetailScreen({super.key});

  final PostDetailController controller = Get.find<PostDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: controller.post.title!),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text("Post Detail"),
        ),
      ),
    );
  }
}
