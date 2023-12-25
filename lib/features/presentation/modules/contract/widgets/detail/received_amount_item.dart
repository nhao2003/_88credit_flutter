import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:flutter/material.dart';
import '../../../../../../config/theme/app_color.dart';
import '../../../../../../config/theme/text_styles.dart';

class ReceivedAmountItem extends StatelessWidget {
  const ReceivedAmountItem({this.title, required this.moneyRequest, super.key});

  final double moneyRequest;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: AppColors.grey200,
        ),
      ),
      child: Column(
        children: [
          Text(
            title ?? "Tổng tiền nhận",
            style: AppTextStyles.semiBold16.colorEx(AppColors.black),
          ),
          const SizedBox(height: 8),
          Text(
            "${moneyRequest.toInt().formatNumberWithCommas} VNĐ",
            style: AppTextStyles.bold30.colorEx(AppColors.green),
          ),
          const SizedBox(height: 5),
          Text(
            "( ${moneyRequest.toInt().convertNumberToWords()} đồng )",
            textAlign: TextAlign.center,
            style: AppTextStyles.medium16.colorEx(AppColors.grey500),
          ),
        ],
      ),
    );
  }
}
