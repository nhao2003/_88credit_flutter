import 'dart:io';

import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/user.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../config/theme/app_color.dart';
import '../../../global_widgets/base_textfield.dart';
import '../../../global_widgets/header_title.dart';
import '../../../global_widgets/picker_images.dart';

// ignore: must_be_immutable
class DialogReport extends StatelessWidget {
  DialogReport({
    required this.user,
    required this.handleReportUser,
    super.key,
  });

  final UserEntity user;
  final Function(UserEntity, String, File) handleReportUser;

  final formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();

  final RxBool isLoading = false.obs;
  String reason = "";

  void onCancel() {
    Get.back();
    textController.clear();
  }

  void onAccept() async {
    if (!formKey.currentState!.validate()) return;
    if (image.value == null) {
      Get.snackbar("Thông báo", "Vui lòng chọn ảnh minh chứng",
          backgroundColor: AppColors.red, colorText: Colors.white);
      return;
    }
    await handleReportUser(user, reason, image.value!);
  }

  // images
  bool? photoController;

  // portrait
  Rx<File?> image = Rxn(null);

  final ImagePicker _picker = ImagePicker();

  Future<File> imgFromGallery() async {
    final pickedImages = await _picker.pickImage(source: ImageSource.gallery);
    return File(pickedImages!.path);
  }

  Future<File> imgFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    } else {
      return File('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      alignment: Alignment.center,
      contentPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const HeaderTitle(
                  title: "Báo cáo người dùng",
                  paddingLeft: 0,
                ),
                const SizedBox(height: 20),
                BaseTextField(
                  minLines: 3,
                  maxLines: 10,
                  maxLength: 1000,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: textController,
                  labelText: 'Lý do báo cáo',
                  hintText: 'Mô tả lý do báo cáo',
                  onSaved: (value) {
                    reason = value!;
                  },
                  validator: (value) => (value!.trim().isNotEmpty)
                      ? null
                      : 'Mô tả không được rỗng',
                ),
                const HeaderTitle(
                  title: "Ảnh minh chứng",
                  paddingLeft: 0,
                ),
                const SizedBox(height: 10),
                PickerImage(
                  imageFile: image,
                  imgFromCamera: () {
                    imgFromCamera().then((value) {
                      image.value = value;
                    });
                  },
                  imgFromGallery: () {
                    imgFromGallery().then((value) {
                      image.value = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseButton(
                      title: "Hủy",
                      colorButton: AppColors.red,
                      width: 33.wp,
                      isLoading: isLoading,
                      onClick: onCancel,
                    ),
                    const SizedBox(width: 10),
                    BaseButton(
                      title: "Báo cáo",
                      width: 33.wp,
                      isLoading: isLoading,
                      onClick: onAccept,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
