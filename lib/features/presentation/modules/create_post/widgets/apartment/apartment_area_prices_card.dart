import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/base_textfield.dart';
import '../../create_post_controller.dart';

class ApartmentAreaPricesCard extends StatelessWidget {
  ApartmentAreaPricesCard({super.key});

  final CreatePostController controller = Get.find<CreatePostController>();

  final _areaFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _depositFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        BaseTextField(
          focusNode: _areaFocusNode,
          nexFocusNode: _priceFocusNode,
          maxLines: 1,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: controller.apartmentAreaTC,
          labelText: 'Diện tích (m2)',
          hintText: "Diện tích",
          onSaved: (value) {
            controller.apartmentArea = value!.trim();
          },
        ),
        const SizedBox(height: 15),
        BaseTextField(
          focusNode: _priceFocusNode,
          nexFocusNode: _depositFocusNode,
          maxLines: 1,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: controller.apartmentPriceTC,
          labelText: 'Giá (VNĐ)',
          hintText: "Giá",
          onSaved: (value) {
            controller.apartmentPrice = value!.trim();
          },
        ),
        const SizedBox(height: 15),
        Obx(
          () => Visibility(
            visible: !controller.isLease.value,
            child: BaseTextField(
              focusNode: _depositFocusNode,
              maxLines: 1,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: controller.apartmentDepositTC,
              labelText: 'Số tiền cọc (VNĐ)',
              hintText: "Không bắt buộc",
              onSaved: (value) {
                controller.apartmentDeposit = value!.trim();
              },
            ),
          ),
        ),
      ],
    );
  }
}
