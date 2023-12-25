import 'package:_88credit_flutter/config/values/asset_image.dart';
import 'package:_88credit_flutter/core/extensions/date_ex.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';

class ContractItem extends StatelessWidget {
  final ContractEntity contract;
  const ContractItem(this.contract, {super.key});

  bool checkIsLoan() {
    return true;
  }

  String getStatusText() {
    if (checkIsLoan()) {
      return "Cho vay";
    } else {
      return "Vay tiền";
    }
  }

  Color getColorStatus() {
    if (checkIsLoan()) {
      return AppColors.green800;
    } else {
      return AppColors.blue800;
    }
  }

  Color getColorBackground() {
    if (checkIsLoan()) {
      return AppColors.green100;
    } else {
      return AppColors.blue100;
    }
  }

  void navToContractDetail() {
    Get.toNamed(AppRoutes.contractDetail, arguments: [contract, false]);
  }

  @override
  Widget build(BuildContext context) {
    const double sizeImage = 50;
    const double widthItem = 100;

    return InkWell(
      onTap: () {
        navToContractDetail();
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.grey300,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Image.asset(
                      Assets.contract,
                      height: sizeImage,
                      width: sizeImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Name and stars
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: getColorBackground(),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                getStatusText(),
                                style: AppTextStyles.medium12
                                    .copyWith(color: getColorStatus()),
                              ),
                            ),
                            // days and contact button
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.greenLight,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    "Chi tiết",
                                    style: AppTextStyles.semiBold12.colorEx(
                                      AppColors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            SizedBox(
                              width: widthItem,
                              child: Text(
                                "Số tiền:",
                                style: AppTextStyles.regular12
                                    .colorEx(AppColors.black),
                              ),
                            ),
                            Text(
                              "${contract.amount!.toInt().formatNumberWithCommas} VNĐ",
                              style:
                                  AppTextStyles.bold12.colorEx(AppColors.green),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            SizedBox(
                              width: widthItem,
                              child: Text(
                                "Người vay:",
                                style: AppTextStyles.regular12
                                    .colorEx(AppColors.black),
                              ),
                            ),
                            Text(
                              contract.borrower!.fullName,
                              style:
                                  AppTextStyles.bold12.colorEx(AppColors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            SizedBox(
                              width: widthItem,
                              child: Text(
                                "Người cho vay:",
                                style: AppTextStyles.regular12
                                    .colorEx(AppColors.black),
                              ),
                            ),
                            Text(
                              contract.lender!.fullName,
                              style:
                                  AppTextStyles.bold12.colorEx(AppColors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            SizedBox(
                              width: widthItem,
                              child: Text(
                                "Ngày tạo:",
                                style: AppTextStyles.regular12
                                    .colorEx(AppColors.black),
                              ),
                            ),
                            Text(
                              contract.createdAt!.toDMYString(),
                              style:
                                  AppTextStyles.bold12.colorEx(AppColors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
