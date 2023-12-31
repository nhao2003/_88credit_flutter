import 'package:flutter/material.dart';
import 'package:_88credit_flutter/config/values/asset_image.dart';
import '../../../../../config/theme/app_color.dart';
import 'user_posts.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({super.key});

  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: AppColors.green,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  icon: Image.asset(
                    Assets.grid,
                    width: 20,
                    height: 20,
                    color: _tabController.index == 0 ? AppColors.green : null,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    Assets.chat,
                    width: 20,
                    height: 20,
                    color: _tabController.index == 1 ? AppColors.green : null,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  UserPosts(),
                  const Scaffold(
                    body: Center(
                      child: Text('Chưa có tin nhắn'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
