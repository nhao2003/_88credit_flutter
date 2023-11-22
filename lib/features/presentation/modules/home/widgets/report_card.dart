import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/config/values/asset_image.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/app_color.dart';

class ReportCard extends StatefulWidget {
  const ReportCard({super.key});

  @override
  State<ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  final HomeController controller = Get.find<HomeController>();

  bool isShowLended = false;

  bool isShowBorrowed = false;

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
          Row(
            children: [
              Text.rich(
                TextSpan(
                  text: 'Đã vay:    ',
                  style: AppTextStyles.medium14.colorEx(AppColors.black),
                  children: <InlineSpan>[
                    TextSpan(
                      text: isShowLended
                          ? "****** VNĐ"
                          : '${controller.lendedUsed.value} VNĐ',
                      style: AppTextStyles.bold14.colorEx(AppColors.green),
                    )
                  ],
                ),
              ),
              const Spacer(),
              InkResponse(
                onTap: () {
                  setState(() {
                    isShowLended = !isShowLended;
                  });
                },
                child: Image.asset(
                  isShowLended ? Assets.eyeOff : Assets.eye,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 1,
            color: AppColors.grey200,
          ),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  text: 'Cho vay:  ',
                  style: AppTextStyles.medium14.colorEx(AppColors.black),
                  children: <InlineSpan>[
                    TextSpan(
                      text: isShowBorrowed
                          ? "****** VNĐ"
                          : '${controller.borrowedUsed.value} VNĐ',
                      style: AppTextStyles.bold14.colorEx(AppColors.green),
                    )
                  ],
                ),
              ),
              const Spacer(),
              InkResponse(
                onTap: () {
                  setState(() {
                    isShowBorrowed = !isShowBorrowed;
                  });
                },
                child: Image.asset(
                  isShowBorrowed ? Assets.eyeOff : Assets.eye,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
