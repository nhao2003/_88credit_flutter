import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/utils/add_months_date.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/base_button.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/header_title.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/contract_controler.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail_request/credit_card.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail_request/dialog_cancel.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail_request/image_card.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail_request/loan_amount_card.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail_request/more_request_info_card.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail_request/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/my_appbar.dart';
import '../../post_detail/widgets/description_card.dart';
import '../widgets/detail_request/received_amount_item.dart';

class RequestDetailScreen extends StatelessWidget {
  RequestDetailScreen({super.key});

  final ContractController controller = Get.find<ContractController>();

  final LoanRequestEntity post = Get.arguments as LoanRequestEntity;

  final RxBool isLoading = false.obs;

  void showCommentForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => DialogCancel(
        request: post,
        handleRejectRequest: controller.handleRejectRequest,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Chi tiết yêu cầu"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ReceivedAmountItem(
              moneyRequest: post.loanAmount!,
            ),
            const SizedBox(height: 20),
            LoanAmountCard(
              loanAmount: post.loanAmount!,
              interestAmount: 50000,
              serviceCharge: 10000,
            ),
            const SizedBox(height: 20),
            MoreRequestInfo(
              loanTenureMonths: post.loanTenureMonths!,
              interestRate: post.interestRate!,
              overdueInterestRate: post.overdueInterestRate!,
              loanReasonType: post.loanReasonType!,
              dateLoan: post.createdAt!,
              datePay: AddMonthDate.addMonthsToDateTime(
                  post.createdAt!, post.loanTenureMonths!),
            ),
            const SizedBox(height: 20),
            UserCard(
              name: post.sender!.fullName,
              avatar: post.sender!.avatar!,
              navToProfile: () => controller.navToProfile(post.sender!),
            ),
            const SizedBox(height: 20),
            CreditCard(
              bankName: "Agribank",
              bankNumber: "**** **** **** 3456",
              hanleChooseCard: () {},
            ),
            const SizedBox(height: 10),
            const HeaderTitle(title: "Ảnh chân dung"),
            const SizedBox(height: 10),
            ImageCard(images: [post.portraitPhoto!]),
            const SizedBox(height: 10),
            const HeaderTitle(title: "Ảnh căn cước / CMND:"),
            const SizedBox(height: 10),
            ImageCard(images: [post.idCardFrontPhoto!, post.idCardBackPhoto!]),
            const SizedBox(height: 20),
            DescriptionCard(
              title: "Mô tả yêu cầu",
              description: post.description!,
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
                    showCommentForm(context);
                  },
                ),
                BaseButton(
                  title: "Đồng ý",
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
