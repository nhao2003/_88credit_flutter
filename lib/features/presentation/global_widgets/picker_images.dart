import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import '../../../config/theme/app_color.dart';
import '../../../config/values/asset_image.dart';

class PickerImage extends StatelessWidget {
  const PickerImage({
    required this.imageFile,
    required this.imgFromGallery,
    required this.imgFromCamera,
    super.key,
  });

  final Rx<File?> imageFile;
  final Function imgFromGallery;
  final Function imgFromCamera;

  void _showPicker(context) {
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
                  imgFromGallery();
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Máy ảnh"),
                onTap: () {
                  imgFromCamera();
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(5),
            strokeWidth: 1,
            dashPattern: const [5, 2],
            color: AppColors.green,
            child: imageFile.value == null
                ? Container(
                    height: heightImage,
                    color: AppColors.white,
                    child: GestureDetector(
                      onTap: () {
                        _showPicker(context);
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
                              "Thêm ảnh",
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
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.file(
                                File(imageFile.value!.path),
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
                                    imageFile.value = null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
