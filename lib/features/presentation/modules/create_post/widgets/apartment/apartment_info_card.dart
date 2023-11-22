import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/domain/enums/direction.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/widgets/chatacter_box.dart';
import '../../../../../../config/theme/app_color.dart';
import '../../../../../../config/theme/text_styles.dart';
import '../../../../../domain/enums/apartment_types.dart';
import '../../../../global_widgets/base_dropdown_button.dart';
import '../../../../global_widgets/base_textfield.dart';
import '../../create_post_controller.dart';

class ApartmentInfoCard extends StatelessWidget {
  ApartmentInfoCard({super.key});
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
        CharacterBox(
          title: "Tình trạng bất động sản",
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.setOfficeIsHandOver(true);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: controller.officeIsHandOver.value == true
                            ? AppColors.greenLight
                            : AppColors.grey200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Đã bàn giao",
                        style: AppTextStyles.medium14.copyWith(
                          color: controller.officeIsHandOver.value == true
                              ? AppColors.green
                              : AppColors.grey600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.setOfficeIsHandOver(false);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: controller.officeIsHandOver.value != true
                            ? AppColors.greenLight
                            : AppColors.grey200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Chưa bàn giao",
                        style: AppTextStyles.medium14.copyWith(
                          color: controller.officeIsHandOver.value != true
                              ? AppColors.green
                              : AppColors.grey600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        BaseTextField(
          focusNode: _houseNumberFocusNode,
          maxLines: 1,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          controller: controller.apartmentNumberTC,
          labelText: 'Số chung cư',
          hintText: "Số chung cư",
          onSaved: (value) {
            controller.apartmentNumber = value!.trim();
          },
        ),
        // is facade
        const SizedBox(height: 10),
        CharacterBox(
          title: "Cho phép hiện số chung cư",
          child: Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.isShowapartmentNumber.value,
                  onChanged: (value) =>
                      controller.setIsShowapartmentNumber(value!),
                ),
              ),
              Text("Hiện số chung cư", style: AppTextStyles.regular14),
            ],
          ),
        ),
        const SizedBox(height: 15),
        BaseDropdownButton(
          title: "Loại hình chung cư",
          hint: "Loại hình chung cư",
          value: controller.apartmentType.value,
          items: ApartmentTypes.toMap().entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              controller.setapartmentType(value as ApartmentTypes);
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
                controller: controller.apartmentNumOfBedRoomsTC,
                labelText: 'Số phòng ngủ',
                hintText: 'Số phòng ngủ',
                onSaved: (value) {
                  controller.apartmentNumOfBedRooms = value!.trim();
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
                controller: controller.apartmentNumOfToiletsTC,
                labelText: 'Số phòng vệ sinh',
                hintText: 'Không bắt buộc',
                onSaved: (value) {
                  controller.apartmentNumOfToilets = value!.trim();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        BaseDropdownButton(
          title: "Hướng ban công",
          hint: "Không ban công",
          value: controller.apartmentBalconyDirection.value,
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
              controller.setapartmentBalconyDirection(value as Direction);
            }
          },
          onSaved: (value) {
            if (value == null) return;
          },
        ),
      ],
    );
  }
}
