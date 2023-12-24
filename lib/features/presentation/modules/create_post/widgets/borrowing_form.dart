import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/create_post_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/widgets/base_row_text_dropdown.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/widgets/picker_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../global_widgets/base_dropdown_button.dart';
import '../../../global_widgets/base_textfield.dart';

class BorrowingForm extends StatelessWidget {
  final bool isvisible;

  BorrowingForm({required this.isvisible, super.key});

  final CreatePostController controller = Get.find<CreatePostController>();
  final FocusNode _moneyFocusNode = FocusNode();
  final FocusNode _interestFocusNode = FocusNode();
  final FocusNode _overdueFocusNode = FocusNode();
  final FocusNode _timeFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisible,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Form(
          key: controller.borrowingFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Số tiền",
                style: AppTextStyles.bold14.colorEx(Colors.black),
              ),
              const SizedBox(height: 10),
              BaseTextField(
                focusNode: _moneyFocusNode,
                nexFocusNode: _interestFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: controller.borrowingLoanAmountTextController,
                labelText: 'Số tiền mong muốn (VNĐ)',
                hintText: "Nhập số tiền mong muốn",
                onSaved: (value) {
                  controller.borrowingLoanAmount = double.parse(value!.trim());
                },
                validator: (value) => (value!.trim().isNotEmpty)
                    ? null
                    : 'Số tiền không được rỗng'.tr,
              ),
              const SizedBox(height: 10),
              Text(
                "Lãi suất",
                style: AppTextStyles.bold14.colorEx(Colors.black),
              ),
              const SizedBox(height: 10),
              BaseRowTextDropdown(
                focusNode: _interestFocusNode,
                nexFocusNode: _overdueFocusNode,
                textInputAction: TextInputAction.next,
                labelText: 'Lãi suất mong muốn',
                hintText: "Nhập lãi suất mong muốn",
                controller: controller.borrowingInterestRateTextController,
                onSaved: (value) {
                  try {
                    controller.borrowingInterestRate =
                        double.parse(value!.trim());
                  } catch (e) {
                    print(e);
                  }
                },
                timeValue: controller.timeValue.value,
                onChangeTimeValue: controller.setTimeValue,
                validator: (value) => (value!.trim().isNotEmpty)
                    ? null
                    : 'Lãi suất không được rỗng'.tr,
              ),
              const SizedBox(height: 10),
              Text(
                "Lãi suất quá hạn",
                style: AppTextStyles.bold14.colorEx(Colors.black),
              ),
              const SizedBox(height: 10),
              BaseRowTextDropdown(
                focusNode: _overdueFocusNode,
                nexFocusNode: _timeFocusNode,
                textInputAction: TextInputAction.next,
                labelText: 'Lãi suất quá hạn',
                hintText: "Nhập lãi suất quá hạn",
                controller:
                    controller.borrowingOverdueInterestRateTextController,
                onSaved: (value) {
                  try {
                    controller.borrowingOverdueInterestRate =
                        double.parse(value!.trim());
                  } catch (e) {
                    print(e);
                  }
                },
                timeValue: controller.timeValue.value,
                onChangeTimeValue: controller.setTimeValue,
                validator: (value) => (value!.trim().isNotEmpty)
                    ? null
                    : 'Lãi suất không được rỗng'.tr,
              ),
              const SizedBox(height: 10),
              Text(
                "Kỳ hạn",
                style: AppTextStyles.bold14.colorEx(Colors.black),
              ),
              const SizedBox(height: 10),
              BaseRowTextDropdown(
                focusNode: _timeFocusNode,
                nexFocusNode: _timeFocusNode,
                textInputAction: TextInputAction.done,
                labelText: 'Kỳ hạn mong muốn',
                hintText: "Nhập kỳ hạn mong muốn",
                controller: controller.borrowingTenureMonthsTextController,
                onSaved: (value) {
                  try {
                    controller.borrowingTenureMonths = int.parse(value!.trim());
                  } catch (e) {
                    print(e);
                  }
                },
                timeValue: controller.timeValue.value,
                onChangeTimeValue: controller.setTimeValue,
                validator: (value) => (value!.trim().isNotEmpty)
                    ? null
                    : 'Kỳ hạn không được rỗng'.tr,
              ),
              const SizedBox(height: 10),
              Text(
                "Lý do vay",
                style: AppTextStyles.bold14.colorEx(Colors.black),
              ),
              const SizedBox(height: 10),
              BaseDropdownButton(
                title: "Loại lý do vay",
                hint: "Chọn loại lý do vay",
                value: controller.borrowingLoanReasonType.value,
                items: LoanReasonTypes.toMap().entries.map((entry) {
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
                    controller.setLoanReason(value as LoanReasonTypes);
                  }
                },
                onSaved: (value) {
                  if (value == null) return;
                },
              ),
              const SizedBox(height: 15),
              BaseTextField(
                minLines: 3,
                maxLines: 10,
                maxLength: 1000,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: controller.borrowingLoanReasonTextController,
                labelText: 'Mô tả lý do vay',
                hintText: 'Mô tả lý do vay',
                onSaved: (value) {
                  controller.borrowingLoanReason = value!.trim();
                },
                validator: (value) => (value!.trim().isNotEmpty)
                    ? null
                    : 'Lý do không được rỗng'.tr,
              ),
              const SizedBox(height: 5),
              Text(
                "Hình ảnh",
                style: AppTextStyles.bold14.colorEx(Colors.black),
              ),
              const SizedBox(height: 10),
              const PickerImages(),
            ],
          ),
        ),
      ),
    );
  }
}
