import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import '../post_controler.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  final PostController controller = PostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: "Bài đăng",
        isShowBack: false,
      ),
      body: const Center(
        child: Text('Post Screen'),
      ),
    );
  }
}
