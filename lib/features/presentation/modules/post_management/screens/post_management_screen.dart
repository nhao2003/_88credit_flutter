import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../post_management_controller.dart';
import '../widgets/list_posts_expried.dart';
import '../widgets/list_posts_hided.dart';
import '../widgets/list_posts_pendding.dart';
import '../widgets/list_posts_posted.dart';
import '../widgets/list_posts_reject.dart';

class PostManagementScreen extends StatefulWidget {
  const PostManagementScreen({super.key});

  @override
  State<PostManagementScreen> createState() => _PostManagementScreenState();
}

class _PostManagementScreenState extends State<PostManagementScreen> {
  final PostManagementController controller =
      Get.find<PostManagementController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.typePosts.length,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: const Text('Quản lý tin'),
            leading: const SizedBox(),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: Column(
                  children: [
                    Container(
                      color: AppColors.black,
                      height: 1.0,
                    ),
                    ColoredBox(
                      color: AppColors.white,
                      child: TabBar(
                          isScrollable: true,
                          unselectedLabelColor:
                              const Color.fromARGB(206, 73, 69, 79),
                          indicator: const UnderlineTabIndicator(
                            borderSide:
                                BorderSide(color: AppColors.green, width: 2),
                          ),
                          dividerColor: AppColors.green,
                          labelColor: AppColors.black,
                          tabs: controller.typePosts.map((e) {
                            return Tab(
                              child: Text(e),
                            );
                          }).toList()),
                    ),
                  ],
                )),
          ),
          body: TabBarView(
            children: <Widget>[
              ListPostsPosted(),
              ListPostsPendding(),
              ListPostsReject(),
              ListPostsHided(),
              ListPostsExpried(),
            ],
          )),
    );
  }
}
