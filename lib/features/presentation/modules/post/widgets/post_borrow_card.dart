import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../../config/values/asset_image.dart';

// ignore: must_be_immutable
class PostBorrowCard extends StatelessWidget {
  PostBorrowCard({this.avatar, super.key});

  final String? avatar;

  final int numOfStars = 4;

  RxBool isLiked = false.obs;

  toggleIsLiked() {
    isLiked.value = !isLiked.value;
  }

  Widget _buildStars() {
    return Row(
      children: List.generate(
        5,
        (index) => Image.asset(
          Assets.star,
          width: 14,
          height: 14,
          color: index < numOfStars ? AppColors.yellow : AppColors.grey200,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // user
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // avatar
            if (avatar != null)
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: "",
                  fit: BoxFit.cover,
                  width: 50,
                  errorWidget: (context, _, __) {
                    return const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(Assets.avatar2),
                    );
                  },
                ),
              )
            else
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(Assets.avatar2),
              ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Name and stars
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.userProfile);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phan Văn Minh",
                              //"Phan Văn Minh",
                              style: AppTextStyles.semiBold14.colorEx(
                                AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            _buildStars(),
                          ],
                        ),
                      ),
                      // days and contact button
                      Row(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Assets.clock,
                                width: 16,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                "30-40 ngày",
                                style: AppTextStyles.regular12.colorEx(
                                  AppColors.grey400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
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
                              "Liên hệ",
                              style: AppTextStyles.semiBold12.colorEx(
                                AppColors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // content
                  const SizedBox(height: 10),
                  // loai bai dang: Vay tien
                  Row(
                    children: [
                      Text(
                        "Loại bài đăng: ",
                        style: AppTextStyles.medium10,
                      ),
                      Text(
                        "Cho vay",
                        style: AppTextStyles.bold10.colorEx(AppColors.green),
                      ),
                    ],
                  ),
                  // title
                  const SizedBox(height: 10),
                  Text(
                    "Cho Vay Tiền Gấp - Ưu Tiên Ai Cần Hỗ Trợ Khẩn Cấp",
                    maxLines: 3,
                    style: AppTextStyles.regular12.colorEx(AppColors.black),
                  ),
                  // thong tin chi tiet
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.postDetail);
                    },
                    child: Container(
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
                                width: 80,
                                child: Text(
                                  "Số tiền:",
                                  style: AppTextStyles.regular12
                                      .colorEx(AppColors.black),
                                ),
                              ),
                              Text(
                                "10.000.000 - 15.000.000 VNĐ",
                                style: AppTextStyles.bold12
                                    .colorEx(AppColors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  "Lãi suất:",
                                  style: AppTextStyles.regular12
                                      .colorEx(AppColors.black),
                                ),
                              ),
                              Text(
                                "12 - 15% / năm",
                                style: AppTextStyles.bold12
                                    .colorEx(AppColors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              SizedBox(
                                width: 80,
                                child: Text(
                                  "Ls quá hạn:",
                                  style: AppTextStyles.regular12
                                      .colorEx(AppColors.black),
                                ),
                              ),
                              Text(
                                "16 - 18% / năm",
                                style: AppTextStyles.bold12
                                    .colorEx(AppColors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Assets.clock,
                            width: 13,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            "1 phút trước",
                            style: AppTextStyles.regular10.colorEx(
                              AppColors.grey400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                        child: Obx(
                          () => IconButton(
                            padding: const EdgeInsets.all(0),
                            icon: Icon(
                              isLiked.value
                                  ? Icons.bookmark
                                  : Icons.bookmark_border_outlined,
                              size: 25,
                            ),
                            color: isLiked.value
                                ? AppColors.yellow
                                : AppColors.grey400,
                            onPressed: () {
                              toggleIsLiked();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          color: AppColors.grey200,
          thickness: 1,
          height: 30,
        )
      ],
    );
  }
}
