import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/app_color.dart';

class MyTabAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyTabAppbar({
    super.key,
    required this.title,
    required this.tabTitle1,
    required this.tabTitle2,
    this.leading,
    this.actions,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final String tabTitle1;
  final String tabTitle2;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: leading,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                    width: 1,
                    color: AppColors.grey200,
                  ),
                ),
                child: TabBar(
                  //controller: _tabController,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: AppColors.green,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: AppColors.green,
                  padding: const EdgeInsets.all(0),
                  indicatorWeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.all(0),
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    SizedBox(
                      width: 100.wp,
                      child: Tab(
                        text: tabTitle1,
                      ),
                    ),

                    // second tab [you can add an icon using the icon property]
                    SizedBox(
                      width: 100.wp,
                      child: Tab(
                        text: tabTitle2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: AppColors.black,
              height: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
