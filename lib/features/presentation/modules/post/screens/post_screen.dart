import 'package:_88credit_flutter/features/presentation/global_widgets/my_tab_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/post/screens/borrow_tab_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/post/screens/lending_tab_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../config/theme/app_color.dart';
import '../post_controler.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  final PostController controller = PostController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MyTabAppbar(
          title: "Bài đăng",
          tabTitle1: "Vay tiền",
          tabTitle2: "Cho vay",
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: AppColors.grey500,
                ),
              ),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: const Icon(
                Icons.bookmark_border_outlined,
                size: 25,
              ),
              color: AppColors.grey500,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            BorrowTabScreen(),
            LendingTabScreen(),
          ],
        ),
      ),
    );
  }
}
