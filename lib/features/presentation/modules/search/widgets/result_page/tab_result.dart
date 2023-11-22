import 'package:flutter/material.dart';

import '../../../../../../config/theme/app_color.dart';

class TabResult extends StatelessWidget {
  const TabResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: AppColors.green,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: "Liên quan",
                ),
                Tab(
                  text: "Tin mới nhất",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  //RelatedList(OrderBy.priceAsc),
                  //RelatedList(OrderBy.createdAtDesc),
                  Scaffold(),
                  Scaffold(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
