import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import 'package:_88credit_flutter/features/domain/enums/post_type.dart';
import 'package:_88credit_flutter/features/presentation/modules/post_detail/widgets/info_row.dart';
import 'package:flutter/material.dart';
import '../../../../../config/theme/app_color.dart';

class InfoCard extends StatelessWidget {
  final PostEntity post;
  const InfoCard({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(
            title: "Số tiền: ",
            value: post.type == PostTypes.borrowing
                ? "${post.loanAmount!.toInt().formatNumberWithCommas} VNĐ"
                : "${post.loanAmount!.toInt().formatNumberWithCommas} - ${post.maxLoanAmount!.toInt().formatNumberWithCommas} VNĐ",
          ),
          const SizedBox(height: 5),
          InfoRow(
            title: "Kỳ hạn: ",
            value: post.type == PostTypes.borrowing
                ? "${post.tenureMonths!} tháng"
                : "${post.tenureMonths!} - ${post.maxTenureMonths!} tháng",
          ),
          const SizedBox(height: 5),
          InfoRow(
            title: "Lãi suất: ",
            value: post.type == PostTypes.borrowing
                ? "${post.interestRate!}% / tháng"
                : "${post.interestRate!} - ${post.maxInterestRate!}% / tháng",
          ),
          const SizedBox(height: 5),
          if (post.type == PostTypes.borrowing)
            InfoRow(
              title: "Lý do vay: ",
              value: post.loanReasonType!.toStringVi(),
            ),
          if (post.type == PostTypes.lending)
            InfoRow(
              title: "Ls quá hạn: ",
              value:
                  "${post.overdueInterestRate!} - ${post.maxOverdueInterestRate!}% / tháng",
            ),
        ],
      ),
    );
  }
}
