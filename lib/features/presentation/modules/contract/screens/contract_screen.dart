import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/screens/contract_tab_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/screens/request_tab_screen.dart';
import 'package:flutter/material.dart';
import '../../../global_widgets/my_tab_appbar.dart';
import '../contract_controler.dart';

class ContractScreen extends StatelessWidget {
  ContractScreen({super.key});

  final ContractController controller = ContractController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const MyTabAppbar(
          title: "Hợp đồng",
          tabTitle1: "Yêu cầu",
          tabTitle2: "Hợp đồng",
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            RequestTabScreen(),
            ContractTabScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            controller.navToCreateRequest();
          },
          backgroundColor: AppColors.green,
          extendedPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          label: Text(
            "Tạo yêu cầu",
            style: AppTextStyles.bold12.colorEx(
              AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
