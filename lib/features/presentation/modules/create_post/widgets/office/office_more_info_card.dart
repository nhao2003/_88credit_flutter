import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/domain/enums/furniture_status.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/create_post_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/widgets/chatacter_box.dart';
import '../../../../../domain/enums/legal_document_status.dart';
import '../../../../global_widgets/base_dropdown_button.dart';

class OfficeMoreInfoCard extends StatelessWidget {
  OfficeMoreInfoCard({super.key});

  final CreatePostController controller = Get.find<CreatePostController>();

  @override
  Widget build(BuildContext context) {
    final double widthDropdown = 38.wp;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthDropdown,
              child: BaseDropdownButton(
                title: "Giấy tờ pháp lý",
                hint: "Không bắt buộc",
                isSetSelectedItemBuilder: true,
                value: controller.officeLegalDocumentStatus.value,
                items: LegalDocumentStatus.toMap().entries.map((entry) {
                  return DropdownMenuItem(
                    value: entry.key,
                    child: Text(
                      entry.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.setOfficeLegalDocumentStatus(
                        value as LegalDocumentStatus);
                  }
                },
                onSaved: (value) {
                  if (value == null) return;
                },
              ),
            ),
            SizedBox(
              width: widthDropdown,
              child: BaseDropdownButton(
                title: "Tình trạng nội thất",
                hint: "Không bắt buộc",
                isSetSelectedItemBuilder: true,
                value: controller.officeFurnitureStatus.value,
                items: FurnitureStatus.toMap().entries.map((entry) {
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
                    controller
                        .setOfficeFurnitureStatus(value as FurnitureStatus);
                  }
                },
                onSaved: (value) {
                  if (value == null) return;
                },
              ),
            ),
          ],
        ),

        // is facade
        const SizedBox(height: 10),
        CharacterBox(
          title: "Đặt điểm văn phòng",
          child: Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.officeIsFacade.value,
                  onChanged: (value) => controller.setOfficeIsFacade(value!),
                ),
              ),
              Text("Mặt tiền", style: AppTextStyles.regular14),
            ],
          ),
        ),
      ],
    );
  }
}
