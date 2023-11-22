import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/domain/enums/property_types.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/widgets/picker_images.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../global_widgets/base_textfield.dart';
import '../create_post_controller.dart';

class AddressImagesCard extends StatelessWidget {
  AddressImagesCard({super.key});
  final CreatePostController controller = Get.find<CreatePostController>();

  final _apartmentNameFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _blockFocusNode = FocusNode();
  final _floorFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        BaseTextField(
          focusNode: _apartmentNameFocusNode,
          minLines: 1,
          keyboardType: TextInputType.text,
          controller: controller.apartmentNameTextController,
          labelText: 'Tên tòa nhà / khu dân cư / dự án',
          hintText:
              controller.selectedPropertyType.value == PropertyTypes.apartment
                  ? 'Tên tòa nhà / khu dân cư / dự án'.tr
                  : "(Không bắt buộc)",
          onSaved: (value) {
            controller.apartmentName = value!.trim();
          },
          validator: (value) =>
              (value!.trim().isNotEmpty) ? null : 'Tiêu đề không được rỗng'.tr,
        ),
        const SizedBox(height: 15),
        Obx(
          () => Visibility(
            visible: controller.selectedPropertyType.value ==
                    PropertyTypes.apartment ||
                controller.selectedPropertyType.value == PropertyTypes.office,
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 37.wp,
                    child: BaseTextField(
                      focusNode: _floorFocusNode,
                      nexFocusNode: _blockFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: controller.floorTextController,
                      labelText: 'Tầng',
                      hintText: 'Tầng',
                      onSaved: (value) {
                        controller.floor = value!.trim();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 40.wp,
                    child: BaseTextField(
                      focusNode: _blockFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: controller.blockTextController,
                      labelText: 'Block/Tòa',
                      hintText: 'Block/Tòa',
                      onSaved: (value) {
                        controller.block = value!.trim();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        TextFormField(
          focusNode: _addressFocusNode,
          controller: controller.addressTextController,
          keyboardType: TextInputType.text,
          readOnly: true,
          textInputAction: TextInputAction.done,
          style: AppTextStyles.regular14.colorEx(Colors.black),
          decoration: const InputDecoration(
            labelText: 'Địa chỉ',
            hintText: "Địa chỉ",
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            filled: true,
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          onTapOutside: (event) {
            _addressFocusNode.unfocus();
          },
          onTap: () {},
          onSaved: (value) {
            controller.address = value!.trim();
          },
        ),
        const SizedBox(height: 15),
        const PickerImages(),
      ],
    );
  }
}
