import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import 'infor_card.dart';

class InforCardList extends StatelessWidget {
  final String title;
  final Function getListFunc;
  const InforCardList({
    super.key,
    required this.title,
    required this.getListFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 35.hp),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              title,
              style: AppTextStyles.bold14,
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: FutureBuilder<List<PostEntity>>(
              future: getListFunc(),
              builder: (context, snapShot) {
                if (!snapShot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<PostEntity> data = snapShot.data!;
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InforCard(key: UniqueKey(), post: data[index]);
                    },
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomTapAnimation(
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(
                      bottom: 2, // space between underline and text
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.grey500, // Text colour here
                          width: 0.5, // Underline width
                        ),
                      ),
                    ),
                    child: Text(
                      'Xem thêm 12.345 mẫu tin khác'.tr,
                      style: AppTextStyles.regular12.copyWith(
                        color: AppColors.grey500,
                        //decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
