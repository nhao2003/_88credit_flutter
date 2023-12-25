import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/picker_images.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/picker_video.dart';
import 'package:flutter/material.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../create_request_controler.dart';

class ImagesForm extends StatelessWidget {
  final bool isvisible;

  const ImagesForm(
      {required this.isvisible, required this.controller, super.key});

  final CreateRequestController controller;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisible,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ảnh chân dung",
              style: AppTextStyles.bold14.colorEx(Colors.black),
            ),
            const SizedBox(height: 10),
            PickerImage(
              imageFile: controller.portrait,
              imgFromCamera: () {
                controller.imgFromCamera().then((value) {
                  controller.portrait.value = value;
                });
              },
              imgFromGallery: () {
                controller.imgFromGallery().then((value) {
                  controller.portrait.value = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Text(
              "Ảnh CCCD mặt trước",
              style: AppTextStyles.bold14.colorEx(Colors.black),
            ),
            const SizedBox(height: 10),
            PickerImage(
              imageFile: controller.idCardFrontPhoto,
              imgFromCamera: () {
                controller.imgFromCamera().then((value) {
                  controller.idCardFrontPhoto.value = value;
                });
              },
              imgFromGallery: () {
                controller.imgFromGallery().then((value) {
                  controller.idCardFrontPhoto.value = value;
                });
              },
            ),
            const SizedBox(height: 5),
            Text(
              "Ảnh CCCD mặt sau",
              style: AppTextStyles.bold14.colorEx(Colors.black),
            ),
            const SizedBox(height: 10),
            PickerImage(
              imageFile: controller.idCardBackPhoto,
              imgFromCamera: () {
                controller.imgFromCamera().then((value) {
                  controller.idCardBackPhoto.value = value;
                });
              },
              imgFromGallery: () {
                controller.imgFromGallery().then((value) {
                  controller.idCardBackPhoto.value = value;
                });
              },
            ),
            const SizedBox(height: 5),
            Text(
              "Video minh chứng",
              style: AppTextStyles.bold14.colorEx(Colors.black),
            ),
            const SizedBox(height: 10),
            PickerVideo(
              videoFile: controller.video,
              videoFromCamera: () async {
                await controller.videoFromCamera().then((value) {
                  controller.video.value = value;
                });
              },
              videoFromGallery: () async {
                await controller.videoFromGallery().then((value) {
                  controller.video.value = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
