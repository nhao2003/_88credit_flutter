import 'package:flutter/material.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../domain/entities/nhagiare/purchase/membership_package.dart';

class MembershipPackageCard extends StatelessWidget {
  final MembershipPackageEntity package;
  final Function(MembershipPackageEntity package)? onTapBuy;

  const MembershipPackageCard(
      {required this.package, this.onTapBuy, super.key});

  Widget textWithCheckIcon(String text, bool isCheck) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            isCheck ? Icons.check : Icons.close,
            color: isCheck ? AppColors.green : AppColors.red,
          ),
          Expanded(
              child: Text(
            text,
            style: AppTextStyles.regular14,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2.0, color: AppColors.green)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              package.name,
              style: AppTextStyles.bold24,
            ),
            RichText(
              text: TextSpan(
                text: package.pricePerMonth.formatNumberWithCommas,
                style: AppTextStyles.semiBold36.colorEx(AppColors.green),
                children: const <TextSpan>[
                  TextSpan(
                    text: ' VND/THÁNG',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                package.description,
                style: AppTextStyles.light16,
              ),
            ),
            textWithCheckIcon("Huy hiệu xác minh", true),
            textWithCheckIcon(
                "${package.monthlyPostLimit} tin đăng/tháng (Hiển thị 14 ngày)",
                true),
            textWithCheckIcon(
                "Ưu tiên hiển thị tin", package.displayPriorityPoint > 0),
            textWithCheckIcon(
                "Ưu tiên duyệt tin", package.postApprovalPriorityPoint > 0),
            FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                onPressed: onTapBuy != null ? () => onTapBuy!(package) : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                child: Text(
                  "Mua ngay",
                  style: AppTextStyles.bold16.colorEx(AppColors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
