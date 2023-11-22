import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/features/domain/enums/furniture_status.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/create_post_controller.dart';
import '../../../../global_widgets/base_dropdown_button.dart';

class MotelMoreInfoCard extends StatelessWidget {
  MotelMoreInfoCard({super.key});

  final CreatePostController controller = Get.find<CreatePostController>();

  @override
  Widget build(BuildContext context) {
    return BaseDropdownButton(
      title: "Tình trạng nội thất",
      hint: "Không bắt buộc",
      value: controller.motelSelectedFurnitureStatus.value,
      items: FurnitureStatus.toMap().entries.map((entry) {
        return DropdownMenuItem(
          value: entry.key,
          child: Text(entry.value),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          controller.setFurnitureStatus(value as FurnitureStatus);
        }
      },
      onSaved: (value) {
        if (value == null) return;
      },
    );
  }
}
