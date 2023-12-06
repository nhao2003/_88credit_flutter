import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../domain/entities/nhagiare/blog/blog.dart';
import '../../blogs/screens/blog_detail_screen.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, this.width, this.height, required this.blog});

  final BlogEntity blog;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double widthBox = width ?? 43.wp;

    return ZoomTapAnimation(
      child: InkWell(
        onTap: () {
          Get.to(() => BlogDetailScreen(), arguments: blog);
        },
        splashColor: AppColors.green,
        child: Container(
          width: widthBox,
          height: height ?? 8.hp,
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
                  imageUrl: blog.thumbnail,
                  fit: BoxFit.cover,
                  height: 140,
                  width: widthBox,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.title,
                        style: AppTextStyles.bold12,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.open_in_new_rounded,
                            size: 12,
                            color: AppColors.grey400,
                          ),
                          const SizedBox(width: 4),
                          SizedBox(
                            width: 145,
                            child: Text(
                              "Xem thêm",
                              maxLines: 1,
                              style: AppTextStyles.medium10
                                  .copyWith(color: AppColors.grey400),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
