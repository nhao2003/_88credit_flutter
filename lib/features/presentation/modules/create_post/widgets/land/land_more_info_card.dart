import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/create_post_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/widgets/chatacter_box.dart';
import '../../../../../domain/enums/legal_document_status.dart';
import '../../../../global_widgets/base_dropdown_button.dart';

class LandMoreInfoCard extends StatelessWidget {
  LandMoreInfoCard({super.key});

  final CreatePostController controller = Get.find<CreatePostController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        BaseDropdownButton(
          title: "Giấy tờ pháp lý",
          hint: "Không bắt buộc",
          isSetSelectedItemBuilder: true,
          value: controller.landLegalDocumentStatus.value,
          items: LegalDocumentStatus.toMap().entries.map((entry) {
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
                  .setLandLegalDocumentStatus(value as LegalDocumentStatus);
            }
          },
          onSaved: (value) {
            if (value == null) return;
          },
        ),
        // is facade
        const SizedBox(height: 10),
        CharacterBox(
          title: "Đặt điểm nhà/đất",
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => SizedBox(
                    width: 30,
                    child: Checkbox(
                      value: controller.landIsFacade.value,
                      onChanged: (value) => controller.setLandIsFacade(value!),
                    ),
                  ),
                ),
                Text("Mặt tiền", style: AppTextStyles.regular14),
                Obx(
                  () => SizedBox(
                    width: 30,
                    child: Checkbox(
                      value: controller.landHasWideAlley.value,
                      onChanged: (value) =>
                          controller.setLandHasWideAlley(value!),
                    ),
                  ),
                ),
                Text("Hẻm xe hơi", style: AppTextStyles.regular14),
                Obx(
                  () => SizedBox(
                    width: 30,
                    child: Checkbox(
                      value: controller.landIsWidensTowardsTheBack.value,
                      onChanged: (value) =>
                          controller.setLandIsWidensTowardsTheBack(value!),
                    ),
                  ),
                ),
                Text("Nở hậu", style: AppTextStyles.regular14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
