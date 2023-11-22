import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/base_textfield.dart';
import '../../create_post_controller.dart';

class MotelInfoCard extends StatelessWidget {
  MotelInfoCard({super.key});
  final CreatePostController controller = Get.find<CreatePostController>();

  final _waterFocusNode = FocusNode();
  final _electricFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        BaseTextField(
          focusNode: _waterFocusNode,
          nexFocusNode: _electricFocusNode,
          maxLines: 1,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: controller.motelWaterPriceTC,
          labelText: 'Giá điện (VNĐ/KWh)',
          hintText: "Giá điện",
          onSaved: (value) {
            controller.motelWaterPrice = double.parse(value!.trim());
          },
        ),
        const SizedBox(height: 15),
        BaseTextField(
          focusNode: _electricFocusNode,
          maxLines: 1,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: controller.motelElectricPriceTC,
          labelText: 'Giá nước (VNĐ/m3)',
          hintText: "Giá nước",
          onSaved: (value) {
            controller.motelElectricPrice = double.parse(value!.trim());
          },
        ),
      ],
    );
  }
}
