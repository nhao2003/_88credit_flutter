import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../bank_controller.dart';

class BankScreen extends StatelessWidget {
  BankScreen({super.key});

  final BankController controller = BankController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Thay đổi thẻ ngân hàng"),
      body: const Center(
        child: Text('Bank Screen'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(AppRoutes.bankList);
        },
        backgroundColor: AppColors.green,
        extendedPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        label: Text(
          "Thêm thẻ",
          style: AppTextStyles.bold12.colorEx(
            AppColors.white,
          ),
        ),
      ),
    );
  }
}
