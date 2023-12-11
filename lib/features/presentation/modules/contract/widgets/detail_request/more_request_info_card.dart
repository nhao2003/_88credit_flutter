import 'package:_88credit_flutter/core/extensions/date_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/theme/app_color.dart';
import '../../../../../../config/theme/text_styles.dart';
import '../../../../../domain/enums/loan_reason_types.dart';

class MoreRequestInfo extends StatelessWidget {
  final int loanTenureMonths;
  final double interestRate;
  final double overdueInterestRate;
  final LoanReasonTypes loanReasonType;
  final DateTime dateLoan;
  final DateTime datePay;

  const MoreRequestInfo(
      {required this.loanTenureMonths,
      required this.interestRate,
      required this.overdueInterestRate,
      required this.loanReasonType,
      required this.dateLoan,
      required this.datePay,
      super.key});

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
          Row(
            children: [
              SizedBox(
                width: widthItem,
                child: Text(
                  "Kỳ hạn:",
                  style: AppTextStyles.regular12.colorEx(AppColors.black),
                ),
              ),
              Text(
                "$loanTenureMonths tháng",
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
                  "Lãi suất:",
                  style: AppTextStyles.regular12.colorEx(AppColors.black),
                ),
              ),
              Text(
                "$interestRate% / tháng",
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
                  "Lãi suất quá hạn:",
                  style: AppTextStyles.regular12.colorEx(AppColors.black),
                ),
              ),
              Text(
                "$overdueInterestRate% / tháng",
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
                  "Lý do vay:",
                  style: AppTextStyles.regular12.colorEx(AppColors.black),
                ),
              ),
              Text(
                loanReasonType.toStringVi(),
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
                  "Ngày vay:",
                  style: AppTextStyles.regular12.colorEx(AppColors.black),
                ),
              ),
              Text(
                dateLoan.toDMYString(),
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
                  "Ngày trả:",
                  style: AppTextStyles.regular12.colorEx(AppColors.black),
                ),
              ),
              Text(
                datePay.toDMYString(),
                style: AppTextStyles.bold12.colorEx(AppColors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
