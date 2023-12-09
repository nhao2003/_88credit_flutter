import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';

class DescriptionCard extends StatefulWidget {
  const DescriptionCard({required this.title, required this.description, super.key});
  final String title;
  final String description;

  @override
  State<DescriptionCard> createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppTextStyles.bold14,
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            child: Text(
              widget.description,
              maxLines: isExpanded ? 100 : 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.regular12,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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
                      isExpanded ? 'Thu gọn' : 'Xem thêm',
                      style: AppTextStyles.regular12.copyWith(
                        color: AppColors.grey500,
                        //decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });

                    if (isExpanded) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
