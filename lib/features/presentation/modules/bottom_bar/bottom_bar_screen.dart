import 'package:_88credit_flutter/features/presentation/modules/contract/screens/contract_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/post/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/features/presentation/modules/account/screens/account_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/bottom_bar/bottom_bar_controller.dart';
import '../../../../config/theme/app_color.dart';
import '../../../../config/values/asset_image.dart';
import '../home/screens/home_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> _pages = [];
  List<TabItem<dynamic>> _tab = [];
  final controller = Get.put(BottomBarController());

  @override
  void initState() {
    super.initState();

    _pages = [
      HomeScreen(),
      PostScreen(),
      const Scaffold(),
      ContractScreen(),
      AccountScreen(),
    ];

    _tab = [
      TabItem(
        icon: Image.asset(Assets.home, color: AppColors.grey700),
        activeIcon: Image.asset(Assets.home, color: AppColors.green),
        title: "Trang chủ".tr,
      ),
      TabItem(
        icon: Image.asset(Assets.chart, color: AppColors.grey700),
        activeIcon: Image.asset(Assets.chart, color: AppColors.green),
        title: 'Bài đăng'.tr,
      ),
      TabItem(
        icon: CircleAvatar(
          backgroundColor: AppColors.green,
          child: Image.asset(
            Assets.pencil,
            width: 40,
          ),
        ),
      ),
      TabItem(
        icon: Image.asset(Assets.clipboard, color: AppColors.grey700),
        activeIcon: Image.asset(Assets.clipboard, color: AppColors.green),
        title: 'Hợp đồng'.tr,
      ),
      TabItem(
        icon: Image.asset(Assets.user),
        activeIcon: Image.asset(Assets.user, color: AppColors.green),
        title: 'Tài khoản'.tr,
      ),
    ];
    controller.tabController = TabController(length: _tab.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      builder: (_) {
        return Scaffold(
          // body: TabBarView(
          //   controller: controller.tabController,
          //   physics: const NeverScrollableScrollPhysics(),
          //   children: _pages,
          // ),
          body: _pages[controller.tabIndex],
          bottomNavigationBar: ConvexAppBar(
            onTap: controller.changeTabIndex,
            backgroundColor: AppColors.white,
            color: AppColors.black,
            activeColor: AppColors.green,
            style: TabStyle.fixedCircle,
            curveSize: 75,
            top: -22,
            height: 55,
            items: _tab,
          ),
        );
      },
    );
  }
}
