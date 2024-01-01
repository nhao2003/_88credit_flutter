import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/bank/widgets/bank_card_list.dart';
import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../bank_controller.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({super.key});

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  final BankController controller = BankController();

  @override
  void initState() {
    controller.getBankCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Thay đổi thẻ ngân hàng"),
      body: RefreshIndicator(
        onRefresh: controller.getBankCards,
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.listBankCards.isEmpty
                  ? Center(
                      child: Text(
                        "Bạn chưa có thẻ ngân hàng nào",
                        style: AppTextStyles.bold16.colorEx(
                          AppColors.green,
                        ),
                      ),
                    )
                  : BankCardList(
                      listBanks: controller.listBankCards,
                      onTap: controller.setPrimaryCard,
                      onDeleteCard: controller.deleteBankCard,
                    ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.navigateToAddBankCard();
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
