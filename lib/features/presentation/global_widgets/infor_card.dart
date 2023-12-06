import 'package:_88credit_flutter/core/extensions/date_ex.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/config/values/asset_image.dart';
import 'package:_88credit_flutter/core/extensions/double_ex.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/home/widgets/icon_text.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../domain/entities/credit/post.dart';

class InforCard extends StatelessWidget {
  const InforCard({super.key, this.width, this.height, required this.post});

  final PostEntity post;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double widthBox = width ?? 43.wp;

    return ZoomTapAnimation(
      child: InkWell(
        onTap: () {
          Get.toNamed(
            AppRoutes.getPostRoute(post.id!),
            arguments: post,
          );
        },
        splashColor: AppColors.green,
        child: Container(
          width: widthBox,
          height: height ?? 10.hp,
          decoration: BoxDecoration(
            color: AppColors.grey100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: post.images!.first,
                  fit: BoxFit.fill,
                  height: 110,
                  width: widthBox,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title!,
                      style: AppTextStyles.bold12,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    IconText(
                      icon: Assets.money,
                      text: post.loanAmount!.toFormattedMoney(),
                      color: AppColors.orange,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    IconText(
                      icon: Assets.home,
                      text: post.interestRate!.toFormattedMoney(),
                      color: AppColors.grey500,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    IconText(
                      icon: Assets.clock,
                      text: post.createdAt!.getTimeAgoVi(),
                      color: AppColors.grey500,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
