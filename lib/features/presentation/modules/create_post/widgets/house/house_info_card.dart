import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/domain/enums/direction.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/widgets/chatacter_box.dart';
import '../../../../../../config/theme/text_styles.dart';
import '../../../../../domain/enums/house_types.dart';
import '../../../../global_widgets/base_dropdown_button.dart';
import '../../../../global_widgets/base_textfield.dart';
import '../../create_post_controller.dart';

class HouseInfoCard extends StatelessWidget {
  HouseInfoCard({super.key});
  final CreatePostController controller = Get.find<CreatePostController>();

  final _houseNumberFocusNode = FocusNode();
  final _numBedFocusNode = FocusNode();
  final _numToiletFocusNode = FocusNode();
  final _numFloorFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final widthBox = 38.wp;
    return Column(
      children: [
        const SizedBox(height: 5),
        BaseTextField(
          focusNode: _houseNumberFocusNode,
          maxLines: 1,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          controller: controller.houseNumberTC,
          labelText: 'Số nhà',
          hintText: "Số nhà",
          onSaved: (value) {
            controller.houseNumber = value!.trim();
          },
        ),
        // is facade
        const SizedBox(height: 10),
        CharacterBox(
          title: "Cho phép hiện số nhà",
          child: Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.isShowHouseNumber.value,
                  onChanged: (value) => controller.setIsShowHouseNumber(value!),
                ),
              ),
              Text("Hiện số nhà", style: AppTextStyles.regular14),
            ],
          ),
        ),
        const SizedBox(height: 15),
        BaseDropdownButton(
          title: "Loại hình nhà ở",
          hint: "Loại hình nhà ở",
          value: controller.houseType.value,
          items: HouseTypes.toMap().entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              controller.setHouseType(value as HouseTypes);
            }
          },
          onSaved: (value) {
            if (value == null) return;
          },
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthBox,
              child: BaseTextField(
                focusNode: _numBedFocusNode,
                nexFocusNode: _numToiletFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: controller.houseNumOfBedRoomsTC,
                labelText: 'Số phòng ngủ',
                hintText: 'Số phòng ngủ',
                onSaved: (value) {
                  controller.houseNumOfBedRooms = value!.trim();
                },
              ),
            ),
            SizedBox(
              width: widthBox,
              child: BaseTextField(
                focusNode: _numToiletFocusNode,
                nexFocusNode: _numFloorFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                controller: controller.houseNumOfToiletsTC,
                labelText: 'Số phòng vệ sinh',
                hintText: 'Không bắt buộc',
                onSaved: (value) {
                  controller.houseNumOfToilets = value!.trim();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthBox,
              child: BaseTextField(
                focusNode: _numFloorFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                controller: controller.houseNumOfFloorsTC,
                labelText: 'Số tầng',
                hintText: 'Không bắt buộc',
                onSaved: (value) {
                  controller.houseNumOfFloors = value!.trim();
                },
              ),
            ),
            SizedBox(
              width: widthBox,
              child: BaseDropdownButton(
                title: "Hướng cửa chính",
                hint: "Không bắt buộc",
                isSetSelectedItemBuilder: true,
                value: controller.houseMainDoorDirection.value,
                items: Direction.toMap().entries.map((entry) {
                  return DropdownMenuItem(
                    value: entry.key,
                    child: Text(
                      entry.value,
                      overflow: TextOverflow.visible,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.setHouseMainDoorDirection(value as Direction);
                  }
                },
                onSaved: (value) {
                  if (value == null) return;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
