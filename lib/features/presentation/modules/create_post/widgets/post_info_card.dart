import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_textfield.dart';
import '../create_post_controller.dart';

class PostInfoCard extends StatelessWidget {
  PostInfoCard({super.key});
  final CreatePostController controller = Get.find<CreatePostController>();

  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.infoFormKey,
      child: Column(
        children: [
          const SizedBox(height: 5),
          BaseTextField(
            focusNode: _titleFocusNode,
            nexFocusNode: _descriptionFocusNode,
            minLines: 1,
            maxLines: 5,
            maxLength: 255,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: controller.titleTextController,
            labelText: 'Tiêu đề',
            hintText: 'Nhập tiều đề',
            onSaved: (value) {
              controller.title = value!.trim();
            },
            validator: (value) => (value!.trim().isNotEmpty)
                ? null
                : 'Tiêu đề không được rỗng'.tr,
          ),
          const SizedBox(height: 10),
          BaseTextField(
            focusNode: _descriptionFocusNode,
            minLines: 3,
            maxLines: 10,
            maxLength: 1000,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: controller.descriptionTextController,
            labelText: 'Mô tả chi tiết',
            hintText: 'Mô tả chi tiết',
            onSaved: (value) {
              controller.description = value!.trim();
            },
            validator: (value) =>
                (value!.trim().isNotEmpty) ? null : 'Mô tả không được rỗng'.tr,
          ),
        ],
      ),
    );
  }
}
