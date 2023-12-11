import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../global_widgets/carousel_ad.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({required this.images, super.key});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    if (images.length > 1) {
      return CarouselAd(
        imgList: images,
        aspectRatio: 1.9,
        indicatorSize: 8,
      );
    } else {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: CachedNetworkImage(
          imageUrl: images[0],
          fit: BoxFit.cover,
          width: 100.wp,
          height: 50.wp,
          errorWidget: (context, _, __) {
            return const Placeholder();
          },
        ),
      );
    }
  }
}
