import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/create_post_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/widgets/picker_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../global_widgets/base_textfield.dart';
import 'base_row_text_dropdown.dart';

class LendingForm extends StatelessWidget {
  final bool isvisible;

  LendingForm({required this.isvisible, super.key});

  final CreatePostController controller = Get.find<CreatePostController>();
  final FocusNode _moneyFocusNode = FocusNode();
  final FocusNode _maxMoneyFocusNode = FocusNode();
  final FocusNode _interestFocusNode = FocusNode();
  final FocusNode _maxInterestFocusNode = FocusNode();
  final FocusNode _timeFocusNode = FocusNode();
  final FocusNode _maxTimeFocusNode = FocusNode();
  final FocusNode _overdueFocusNode = FocusNode();
  final FocusNode _maxOverdueFocusNode = FocusNode();

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
          key: controller.lendingFormKey,
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
                nexFocusNode: _maxMoneyFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: controller.lendingLoanAmountTextController,
                labelText: 'Số tiền tối thiểu (VNĐ)',
                hintText: "Nhập số tiền tối thiểu cho vay",
                onSaved: (value) {
                  try {
                    controller.lendingLoanAmount = double.parse(value!.trim());
                  } catch (e) {
                    print(e);
                  }
                },
                validator: (value) => (value!.trim().isNotEmpty)
                    ? null
                    : 'Số tiền không được rỗng'.tr,
              ),
              const SizedBox(height: 10),
              BaseTextField(
                focusNode: _maxMoneyFocusNode,
                nexFocusNode: _interestFocusNode,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: controller.lendingMaxLoanAmountTextController,
                labelText: 'Số tiền tối đa (VNĐ)',
                hintText: "Nhập số tiền tối đa cho vay",
                onSaved: (value) {
                  try {
                    controller.lendingMaxLoanAmount =
                        double.parse(value!.trim());
                  } catch (e) {
                    print(e);
                  }
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
                nexFocusNode: _maxInterestFocusNode,
                textInputAction: TextInputAction.next,
                labelText: 'Lãi suất tối thiểu',
                hintText: "Nhập lãi suất tối thiểu",
                controller: controller.lendingInterestRateTextController,
                onSaved: (value) {
                  try {
                    controller.lendingInterestRate =
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
              BaseRowTextDropdown(
                focusNode: _maxInterestFocusNode,
                nexFocusNode: _timeFocusNode,
                textInputAction: TextInputAction.next,
                labelText: 'Lãi suất tối đa',
                hintText: "Nhập lãi suất tối đa",
                controller: controller.lendingMaxInterestRateTextController,
                onSaved: (value) {
                  try {
                    controller.lendingMaxInterestRate =
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
                nexFocusNode: _maxTimeFocusNode,
                textInputAction: TextInputAction.next,
                labelText: 'Kỳ hạn tối thiểu',
                hintText: "Nhập kỳ hạn tối thiểu",
                controller: controller.lendingTenureMonthsTextController,
                onSaved: (value) {
                  try {
                    controller.lendingTenureMonths = int.parse(value!.trim());
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
              BaseRowTextDropdown(
                focusNode: _maxTimeFocusNode,
                nexFocusNode: _overdueFocusNode,
                textInputAction: TextInputAction.next,
                labelText: 'Kỳ hạn tối đa',
                hintText: "Nhập kỳ hạn tối đa",
                controller: controller.lendingMaxTenureMonthsTextController,
                onSaved: (value) {
                  try {
                    controller.lendingMaxTenureMonths =
                        int.parse(value!.trim());
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
                "Lãi suất quá hạn",
                style: AppTextStyles.bold14.colorEx(Colors.black),
              ),
              const SizedBox(height: 10),
              BaseRowTextDropdown(
                focusNode: _overdueFocusNode,
                nexFocusNode: _maxOverdueFocusNode,
                textInputAction: TextInputAction.next,
                labelText: 'Lãi suất quá hạn tối thiểu',
                hintText: "Nhập lãi suất quá hạn tối thiểu",
                controller: controller.lendingOverdueInterestRateTextController,
                onSaved: (value) {
                  try {
                    controller.lendingOverdueInterestRate =
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
              BaseRowTextDropdown(
                focusNode: _maxOverdueFocusNode,
                nexFocusNode: _maxOverdueFocusNode,
                textInputAction: TextInputAction.done,
                labelText: 'Lãi suất quá hạn tối đa',
                hintText: "Nhập lãi suất quá hạn tối đa",
                controller:
                    controller.lendingMaxOverdueInterestRateTextController,
                onSaved: (value) {
                  try {
                    controller.lendingMaxOverdueInterestRate =
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
