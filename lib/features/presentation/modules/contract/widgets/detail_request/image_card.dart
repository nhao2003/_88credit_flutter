import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_preview/image_preview.dart';
import '../../../../../../config/theme/app_color.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({required this.images, super.key});

  final List<String> images;

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final double aspectRatio = 1.9;
  final double indicatorSize = 8;
  @override
  Widget build(BuildContext context) {
    if (widget.images.length > 1) {
      return Stack(
        children: [
          CarouselSlider(
            items: widget.images
                .map((item) => Hero(
                      tag: item,
                      child: GestureDetector(
                        onTap: () {
                          openImagesPage(Navigator.of(context),
                              imgUrls: widget.images,
                              imgOriginalUrls: widget.images,
                              index: widget.images.indexOf(item),
                              heroTags: widget.images,
                              onLongPressHandler: (con, url) => debugPrint(url),
                              onPageChanged: (i, widget) async {
                                if (widget != null) return widget;
                                await Future.delayed(
                                    const Duration(seconds: 3));
                                return null;
                              });
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: CachedNetworkImage(
                            imageUrl: item,
                            fit: BoxFit.cover,
                            width: 100.wp,
                            errorWidget: (context, _, __) {
                              return const Placeholder();
                            },
                          ),
                        ),
                      ),
                    ))
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
              aspectRatio: aspectRatio,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: indicatorSize,
                    height: indicatorSize,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    } else {
      return Hero(
        tag: widget.images[0],
        child: GestureDetector(
          onTap: () {
            openImagesPage(Navigator.of(context),
                imgUrls: widget.images,
                imgOriginalUrls: widget.images,
                index: 0,
                heroTags: widget.images,
                onLongPressHandler: (con, url) => debugPrint(url),
                onPageChanged: (i, widget) async {
                  if (widget != null) return widget;
                  await Future.delayed(const Duration(seconds: 3));
                  return null;
                });
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: widget.images[0],
              fit: BoxFit.cover,
              width: 100.wp,
              height: 50.wp,
              errorWidget: (context, _, __) {
                return const Placeholder();
              },
            ),
          ),
        ),
      );
    }
  }
}
