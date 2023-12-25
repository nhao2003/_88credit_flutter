import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/theme/app_color.dart';
import '../../../../../../config/theme/text_styles.dart';

class LoanAmountCard extends StatelessWidget {
  final String? contractId;
  final double loanAmount;
  final double interestAmount;
  final double serviceCharge;

  const LoanAmountCard({
    this.contractId,
    required this.loanAmount,
    required this.interestAmount,
    required this.serviceCharge,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double widthItem = 120;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          if (contractId != null)
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: widthItem,
                      child: Text(
                        "Mã hợp đồng:",
                        style: AppTextStyles.regular12.colorEx(AppColors.black),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        contractId!,
                        style: AppTextStyles.bold12.colorEx(AppColors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          Row(
            children: [
              SizedBox(
                width: widthItem,
                child: Text(
                  "Số tiền cần vay:",
                  style: AppTextStyles.regular12.colorEx(AppColors.black),
                ),
              ),
              Text(
                "${loanAmount.toInt().formatNumberWithCommas} VNĐ",
                style: AppTextStyles.bold12.colorEx(AppColors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: widthItem,
                child: Text(
                  "Tiền lãi nhận:",
                  style: AppTextStyles.regular12.colorEx(AppColors.black),
                ),
              ),
              Text(
                "${interestAmount.toInt().formatNumberWithCommas} VNĐ",
                style: AppTextStyles.bold12.colorEx(AppColors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: widthItem,
                child: Text(
                  "Phí dịch vụ:",
                  style: AppTextStyles.regular12.colorEx(AppColors.black),
                ),
              ),
              Text(
                "${serviceCharge.toInt().formatNumberWithCommas} VNĐ",
                style: AppTextStyles.bold12.colorEx(AppColors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
