import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/features/domain/enums/property_types.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/base_dropdown_button.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/create_post_controller.dart';

class ChooseTypePropertyCard extends StatelessWidget {
  ChooseTypePropertyCard({super.key});

  final CreatePostController controller = Get.find<CreatePostController>();

  List<DropdownMenuItem<PropertyTypes>>? getItems(bool isLease) {
    return PropertyTypes.toMap()
        .entries
        .where((entry) => !(isLease &&
            entry.key == PropertyTypes.motel)) // Lọc theo điều kiện
        .map<DropdownMenuItem<PropertyTypes>>(
          (entry) => DropdownMenuItem<PropertyTypes>(
            value: entry.key,
            child: Text(entry.value),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => BaseDropdownButton(
            hint: "Loại bất động sản",
            value: controller.selectedPropertyType.value,
            items: getItems(controller.isLease.value),
            onChanged: (value) {
              // print type of value
              controller.changeSelectedProperty(value as PropertyTypes);
            },
            onSaved: (value) {
              controller.changeSelectedProperty(value as PropertyTypes);
            },
          ),
        ),
      ],
    );
  }
}
