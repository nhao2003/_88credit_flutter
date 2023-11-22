import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/domain/enums/direction.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/widgets/chatacter_box.dart';
import '../../../../../../config/theme/text_styles.dart';
import '../../../../../domain/enums/land_types.dart';
import '../../../../global_widgets/base_dropdown_button.dart';
import '../../../../global_widgets/base_textfield.dart';
import '../../create_post_controller.dart';

class LandInfoCard extends StatelessWidget {
  LandInfoCard({super.key});
  final CreatePostController controller = Get.find<CreatePostController>();

  final _nameFocusNode = FocusNode();
  final _codeFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final widthBox = 38.wp;
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthBox,
              child: BaseTextField(
                focusNode: _nameFocusNode,
                nexFocusNode: _codeFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: controller.landSubdivisionNameTC,
                labelText: 'Tên phân khu',
                hintText: 'Không bắt buộc',
                onSaved: (value) {
                  controller.landSubdivisionName = value!.trim();
                },
              ),
            ),
            SizedBox(
              width: widthBox,
              child: BaseTextField(
                focusNode: _codeFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: controller.landLotCodeTC,
                labelText: 'Mã lô',
                hintText: 'Không bắt buộc',
                onSaved: (value) {
                  controller.landLotCode = value!.trim();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        CharacterBox(
          title: "Cho phép hiện mã lô",
          child: Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.isShowLandLotCode.value,
                  onChanged: (value) => controller.setIsShowLandLotCode(value!),
                ),
              ),
              Text("Hiện mã lô", style: AppTextStyles.regular14),
            ],
          ),
        ),
        const SizedBox(height: 15),
        BaseDropdownButton(
          title: "Loại hình đất",
          hint: "Loại hình đất",
          value: controller.landType.value,
          items: LandTypes.toMap().entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              controller.setLandType(value as LandTypes);
            }
          },
          onSaved: (value) {
            if (value == null) return;
          },
        ),
        const SizedBox(height: 15),
        BaseDropdownButton(
          title: "Hướng đất chính",
          hint: "Không bắt buộc",
          value: controller.landDirection.value,
          items: Direction.toMap().entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              controller.setLandDirection(value as Direction);
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
