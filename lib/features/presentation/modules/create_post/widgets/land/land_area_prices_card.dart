import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/base_textfield.dart';
import '../../create_post_controller.dart';

class LandAreaPricesCard extends StatelessWidget {
  LandAreaPricesCard({super.key});

  final CreatePostController controller = Get.find<CreatePostController>();

  final _areaFocusNode = FocusNode();
  final _widthFocusNode = FocusNode();
  final _lengthFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _depositFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        BaseTextField(
          focusNode: _areaFocusNode,
          nexFocusNode: _widthFocusNode,
          maxLines: 1,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: controller.landAreaTC,
          labelText: 'Diện tích (m2)',
          hintText: "Diện tích",
          onSaved: (value) {
            controller.landArea = value!.trim();
          },
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 38.wp,
              child: BaseTextField(
                focusNode: _widthFocusNode,
                nexFocusNode: _lengthFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: controller.landWidthTC,
                labelText: 'Chiều ngang (m)',
                hintText: 'Không bắt buộc',
                onSaved: (value) {
                  controller.landWidth = value!.trim();
                },
              ),
            ),
            SizedBox(
              width: 38.wp,
              child: BaseTextField(
                focusNode: _lengthFocusNode,
                nexFocusNode: _priceFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: controller.landLengthTC,
                labelText: 'Chiều dài (m)',
                hintText: 'Không bắt buộc',
                onSaved: (value) {
                  controller.landLength = value!.trim();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        BaseTextField(
          focusNode: _priceFocusNode,
          nexFocusNode: _depositFocusNode,
          maxLines: 1,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: controller.landPriceTC,
          labelText: 'Giá (VNĐ)',
          hintText: "Giá",
          onSaved: (value) {
            controller.landPrice = value!.trim();
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
              controller: controller.landDepositTC,
              labelText: 'Số tiền cọc (VNĐ)',
              hintText: "Không bắt buộc",
              onSaved: (value) {
                controller.landDeposit = value!.trim();
              },
            ),
          ),
        ),
      ],
    );
  }
}
