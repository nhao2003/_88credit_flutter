import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/create_post_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/widgets/chatacter_box.dart';
import '../../../../global_widgets/base_textfield.dart';

class OfficeNameCard extends StatelessWidget {
  OfficeNameCard({super.key});
  final _nameFocusNode = FocusNode();

  final CreatePostController controller = Get.find<CreatePostController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        BaseTextField(
          focusNode: _nameFocusNode,
          maxLines: 1,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          controller: controller.officeNumberTC,
          labelText: 'Số văn phòng',
          hintText: "Số văn phòng",
          onSaved: (value) {
            controller.officeNumber = value!.trim();
          },
        ),
        // is facade
        const SizedBox(height: 10),
        CharacterBox(
          title: "Cho phép hiện số văn phòng",
          child: Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.officeIsShowName.value,
                  onChanged: (value) => controller.setofficeIsShowName(value!),
                ),
              ),
              Text("Hiện số văn phòng", style: AppTextStyles.regular14),
            ],
          ),
        ),
      ],
    );
  }
}
