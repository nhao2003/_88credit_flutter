import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/utils/add_months_date.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/base_button.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/contract_controler.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail/credit_card.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail/loan_amount_card.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail/more_request_info_card.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/my_appbar.dart';
import '../../post_detail/widgets/description_card.dart';
import '../widgets/detail/received_amount_item.dart';

class ContractDetailScreen extends StatelessWidget {
  ContractDetailScreen({super.key});

  final ContractController controller = Get.find<ContractController>();

  final ContractEntity post = Get.arguments as ContractEntity;

  final RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: "Chi tiết hợp đồng",
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Xem trước",
              style: AppTextStyles.regular12.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.green,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ReceivedAmountItem(
              title: "Tổng số tiền người vay sẽ nhận",
              moneyRequest: post.amount!,
            ),
            const SizedBox(height: 20),
            LoanAmountCard(
              contractId: post.id,
              loanAmount: post.amount!,
              interestAmount: 50000,
              serviceCharge: 10000,
            ),
            const SizedBox(height: 20),
            MoreRequestInfo(
              loanTenureMonths: post.tenureInMonths!,
              interestRate: post.interestRate!,
              overdueInterestRate: post.overdueInterestRate!,
              loanReasonType: post.loanReasonType!,
              dateLoan: post.createdAt!,
              datePay: AddMonthDate.addMonthsToDateTime(
                  post.createdAt!, post.tenureInMonths!),
            ),
            const SizedBox(height: 20),
            UserCard(
              title: "Người cho vay",
              name: post.lender!.fullName,
              avatar: post.lender!.avatar!,
              navToProfile: () => controller.navToProfile(post.lender!),
            ),
            const SizedBox(height: 20),
            CreditCard(
              buttonText: "Thay đổi",
              bankName: "Agribank",
              bankNumber: "**** **** **** 3456",
              hanleChooseCard: () {},
            ),
            const SizedBox(height: 20),
            UserCard(
              title: "Người nhận",
              name: post.borrower!.fullName,
              avatar: post.borrower!.avatar!,
              navToProfile: () => controller.navToProfile(post.borrower!),
            ),
            const SizedBox(height: 20),
            CreditCard(
              bankName: "Agribank",
              bankNumber: "**** **** **** 3456",
              hanleChooseCard: () {},
            ),
            const SizedBox(height: 20),
            DescriptionCard(
              title: "Mô tả lý do vay",
              description: post.loanReason!,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseButton(
                  title: "Từ chối",
                  colorButton: AppColors.red,
                  width: 43.wp,
                  isLoading: isLoading,
                  onClick: () {
                    Get.back();
                  },
                ),
                BaseButton(
                  title: "Thanh toán",
                  width: 43.wp,
                  isLoading: isLoading,
                  onClick: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
