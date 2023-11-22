import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../home_controller.dart';

// ignore: must_be_immutable
class ImageButton extends StatefulWidget {
  int index;
  String province;
  ImageButton(this.index, this.province, {super.key});

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: GestureDetector(
        onTap: () {
          // do something when the image is tapped
          //controller.navByProvince(widget.province);
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                width: 100.wp,
                height: 100.wp,
                imageUrl:
                    'https://picsum.photos/412/240?random=${widget.index}',
                fit: BoxFit.fill,
                errorWidget: (context, _, __) {
                  return const Placeholder();
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 10.wp,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.black.withOpacity(0.1),
                ),
                child: Center(
                  child: Text(
                    widget.province,
                    style:
                        AppTextStyles.semiBold14.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
