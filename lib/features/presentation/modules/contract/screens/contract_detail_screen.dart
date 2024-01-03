import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/utils/add_months_date.dart';
import 'package:_88credit_flutter/core/utils/bank_format.dart';
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

class ContractDetailScreen extends StatefulWidget {
  const ContractDetailScreen({super.key});

  @override
  State<ContractDetailScreen> createState() => _ContractDetailScreenState();
}

class _ContractDetailScreenState extends State<ContractDetailScreen> {
  final ContractController controller = Get.find<ContractController>();

  late ContractEntity post;

  late bool isPurchase;

  final RxBool isLoading = false.obs;

  @override
  void initState() {
    var data = Get.arguments;
    post = data[0] as ContractEntity;
    isPurchase = data[1] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: "Chi tiết hợp đồng",
        actions: [
          if (isPurchase)
            TextButton(
              onPressed: () {
                controller.navToPdfScreen(post);
              },
              child: Text(
                "Xem PDF",
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
              buttonText: "Sao chép",
              bankName: post.lenderBankCard!.bank!.shortName,
              bankNumber:
                  BankFormat.formatCardNumber(post.lenderBankCard!.cardNumber!),
              logoBank: post.lenderBankCard!.bank!.logo,
              hanleChooseCard: () {
                controller.copyToClipboard(post.lenderBankCard!.cardNumber!);
              },
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
              bankName: post.borrowerBankCard!.bank!.shortName,
              bankNumber: BankFormat.formatCardNumber(
                  post.borrowerBankCard!.cardNumber!),
              logoBank: post.borrowerBankCard!.bank!.logo,
              hanleChooseCard: () {
                controller.copyToClipboard(post.borrowerBankCard!.cardNumber!);
              },
            ),
            const SizedBox(height: 20),
            DescriptionCard(
              title: "Mô tả lý do vay",
              description: post.loanReason!,
            ),
            const SizedBox(height: 20),
            if (!isPurchase)
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     BaseButton(
              //       title: "Từ chối",
              //       colorButton: AppColors.red,
              //       width: 43.wp,
              //       isLoading: isLoading,
              //       onClick: () {
              //         Get.back();
              //       },
              //     ),
              //     BaseButton(
              //       title: "Thanh toán",
              //       width: 43.wp,
              //       isLoading: isLoading,
              //       onClick: () async => {
              //         //await controller.payContractFee(post),
              //       },
              //     ),
              //   ],
              // )

              BaseButton(
                title: "Xem bản PDF",
                width: 100.wp,
                isLoading: isLoading,
                onClick: () {
                  controller.navToPdfScreen(post);
                },
              ),
          ],
        ),
      ),
    );
  }
}
