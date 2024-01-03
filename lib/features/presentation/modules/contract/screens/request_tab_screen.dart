import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/pending_request_tab.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/sent_request_tab.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/waiting_payment_request_tab.dart';
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
    _tabController = TabController(vsync: this, length: 5);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: AppColors.green,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              SizedBox(
                width: 100.wp / 5,
                child: const Tab(
                  text: "Đã xác nhận",
                ),
              ),
              SizedBox(
                width: 100.wp / 4,
                child: const Tab(
                  text: "Chờ thanh toán",
                ),
              ),
              SizedBox(
                width: 100.wp / 4,
                child: const Tab(
                  text: "Chờ xác nhận",
                ),
              ),
              SizedBox(
                width: 100.wp / 5,
                child: const Tab(
                  text: "Đã gửi",
                ),
              ),
              SizedBox(
                width: 100.wp / 5,
                child: const Tab(
                  text: "Đã hủy",
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                ApprovedRequestTab(),
                WaitingPaymentRequestTab(),
                PendingRequestTab(),
                SentRequestTab(),
                RejectRequestTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
