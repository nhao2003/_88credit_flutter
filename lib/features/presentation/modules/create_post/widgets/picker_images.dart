import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/values/asset_image.dart';
import '../create_post_controller.dart';

class PickerImages extends StatelessWidget {
  const PickerImages({super.key});

  void _showPicker(context, CreatePostController controller) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              const SizedBox(height: 50),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Thư viện"),
                onTap: () {
                  controller.imgFromGallery();
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Máy ảnh"),
                onTap: () {
                  controller.imgFromCamera();
                  Get.back();
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double heightImage = 50.wp;

    return GetBuilder<CreatePostController>(
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(5),
              strokeWidth: 1,
              dashPattern: const [5, 2],
              color: controller.photoController == false
                  ? Colors.red
                  : AppColors.green,
              child: controller.photo.isEmpty && controller.imageUrlList.isEmpty
                  ? Container(
                      height: heightImage,
                      color: AppColors.white,
                      child: GestureDetector(
                        onTap: () {
                          _showPicker(context, controller);
                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                height: 100,
                                width: 100,
                                image: AssetImage(Assets.addPhoto),
                              ),
                              Text(
                                "Thêm từ 3 đến 12 ảnh",
                                style: AppTextStyles.bold14
                                    .colorEx(AppColors.grey400),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(
                      color: AppColors.white,
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            height: heightImage,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.imageUrlList.length +
                                  1 +
                                  controller.photo.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: heightImage,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 3,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        color: AppColors.white),
                                    child: index == 0
                                        ? GestureDetector(
                                            onTap: () {
                                              _showPicker(context, controller);
                                              //controller.imgFromGallery();
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              // width: MediaQuery.of(context).size.width - 20.w,
                                              height: 80,
                                              width: 80,
                                              child: const Image(
                                                image:
                                                    AssetImage(Assets.addPhoto),
                                              ),
                                            ),
                                          )
                                        : Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              controller.imageUrlList
                                                          .isNotEmpty &&
                                                      index <=
                                                          controller
                                                              .imageUrlList
                                                              .length
                                                  ? CachedNetworkImage(
                                                      imageUrl: controller
                                                              .imageUrlList[
                                                          index - 1],
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.file(
                                                      File(controller
                                                          .photo[index -
                                                              controller
                                                                  .imageUrlList
                                                                  .length -
                                                              1]
                                                          .path),
                                                      fit: BoxFit.cover,
                                                      height: heightImage,
                                                    ),
                                              Positioned(
                                                top: -10,
                                                right: -10,
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Icons.close,
                                                    size: 20,
                                                    color: AppColors.green,
                                                  ),
                                                  onPressed: () {
                                                    controller
                                                        .deleteImage(index - 1);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            const SizedBox(height: 8),
            Visibility(
              visible: controller.photoController == false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Số lượng hình ảnh từ 3 đến 12 hình",
                    style: AppTextStyles.regular14.colorEx(AppColors.red),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
