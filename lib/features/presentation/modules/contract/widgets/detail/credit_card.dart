import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:flutter/material.dart';
import '../../../../../../config/theme/app_color.dart';
import '../../../../../../config/theme/text_styles.dart';
import '../../../../../../config/values/asset_image.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    this.buttonText,
    this.logoBank,
    required this.bankName,
    required this.bankNumber,
    required this.hanleChooseCard,
    super.key,
  });

  final String bankName;
  final String bankNumber;
  final Function hanleChooseCard;
  final String? buttonText;
  final String? logoBank;

  void handleCopyBankNumber() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // avatar
              logoBank != null
                  ? Image.network(
                      logoBank!,
                      width: 50,
                      height: 50,
                    )
                  : Image.asset(
                      Assets.creditCard,
                      width: 50,
                      height: 50,
                    ),
              const SizedBox(width: 10),
              // Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bankName,
                    style: AppTextStyles.regular14.colorEx(
                      AppColors.grey700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    bankNumber,
                    style: AppTextStyles.semiBold14.colorEx(
                      AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              hanleChooseCard();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              textStyle: const TextStyle(color: AppColors.white),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    color: AppColors.green,
                    width: 1,
                  )),
            ),
            child: Text(
              buttonText ?? "Sao chép",
              style: AppTextStyles.medium14.colorEx(
                AppColors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
