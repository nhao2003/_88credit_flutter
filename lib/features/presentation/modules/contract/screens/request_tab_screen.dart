import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/pending_request_tab.dart';
import 'package:flutter/material.dart';
import '../../../../../config/theme/app_color.dart';
import '../widgets/approved_request_tab.dart';
import '../widgets/reject_request_tab.dart';

class RequestTabScreen extends StatefulWidget {
  const RequestTabScreen({super.key});

  @override
  State<RequestTabScreen> createState() => _RequestTabScreenState();
}

class _RequestTabScreenState extends State<RequestTabScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: AppColors.green,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  text: "Đã xác nhận",
                ),
                Tab(
                  text: "Chờ xác nhận",
                ),
                Tab(
                  text: "Đã hủy",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  ApprovedRequestTab(),
                  PendingRequestTab(),
                  RejectRequestTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
