import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/features/domain/enums/direction.dart';
import 'package:_88credit_flutter/features/domain/enums/office_types.dart';
import '../../../../global_widgets/base_dropdown_button.dart';
import '../../create_post_controller.dart';

class OfficeInfoCard extends StatelessWidget {
  OfficeInfoCard({super.key});
  final CreatePostController controller = Get.find<CreatePostController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        BaseDropdownButton(
          title: "Loại hình văn phòng",
          hint: "Loại hình văn phòng",
          value: controller.officeType.value,
          items: OfficeTypes.toMap().entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              controller.setOfficeType(value as OfficeTypes);
            }
          },
          onSaved: (value) {
            if (value == null) return;
          },
        ),
        const SizedBox(height: 15),
        BaseDropdownButton(
          title: "Hướng cửa chính",
          hint: "Không bắt buộc",
          value: controller.officeMainDoorDirection.value,
          items: Direction.toMap().entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              controller.setOfficeMainDoorDirection(value as Direction);
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
