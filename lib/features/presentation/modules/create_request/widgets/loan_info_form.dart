import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/widgets/base_row_text_dropdown.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_request/create_request_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../global_widgets/base_dropdown_button.dart';
import '../../../global_widgets/base_textfield.dart';

class LoanInfoForm extends StatelessWidget {
  final bool isvisible;

  LoanInfoForm({required this.isvisible, required this.controller, super.key});

  final CreateRequestController controller;

  final FocusNode _discriptionFocusNode = FocusNode();
  final FocusNode _moneyFocusNode = FocusNode();
  final FocusNode _interestFocusNode = FocusNode();
  final FocusNode _overInterestFocusNode = FocusNode();
  final FocusNode _timeFocusNode = FocusNode();
  final FocusNode _loanReasonFocusNode = FocusNode();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mô tả yêu cầu",
              style: AppTextStyles.bold14.colorEx(Colors.black),
            ),
            const SizedBox(height: 10),
            BaseTextField(
              minLines: 3,
              maxLines: 10,
              maxLength: 1000,
              focusNode: _discriptionFocusNode,
              nexFocusNode: _moneyFocusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              controller: controller.discriptionTextController,
              labelText: 'Mô tả yêu cầu vay',
              hintText: 'Mô tả yêu cầu vay',
              onSaved: (value) {
                controller.discription = value!.trim();
              },
              validator: (value) => (value!.trim().isNotEmpty)
                  ? null
                  : 'Yêu cầu không được rỗng'.tr,
            ),
            const SizedBox(height: 5),
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
              controller: controller.loanAmountTextController,
              labelText: 'Số tiền cần vay (VNĐ)',
              hintText: "Nhập số tiền mong muốn",
              onSaved: (value) {
                try {
                  controller.loanAmount = double.parse(value!.trim());
                } catch (e) {
                  controller.tenureMonths = 0;
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
              nexFocusNode: _overInterestFocusNode,
              textInputAction: TextInputAction.next,
              labelText: 'Lãi suất mong muốn',
              hintText: "Nhập lãi suất mong muốn",
              controller: controller.interestRateTextController,
              onSaved: (value) {
                try {
                  controller.interestRate = double.parse(value!.trim());
                } catch (e) {
                  controller.tenureMonths = 0;
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
              focusNode: _overInterestFocusNode,
              nexFocusNode: _timeFocusNode,
              textInputAction: TextInputAction.next,
              labelText: 'Lãi suất quá hạn',
              hintText: "Nhập lãi suất quá hạn",
              controller: controller.overdueInterestRateTextController,
              onSaved: (value) {
                try {
                  controller.overdueInterestRate = double.parse(value!.trim());
                } catch (e) {
                  controller.tenureMonths = 0;
                }
              },
              timeValue: controller.timeValue.value,
              onChangeTimeValue: controller.setTimeValue,
              validator: (value) => (value!.trim().isNotEmpty)
                  ? null
                  : 'Lãi suất quá hạn không được rỗng'.tr,
            ),
            const SizedBox(height: 10),
            Text(
              "Kỳ hạn",
              style: AppTextStyles.bold14.colorEx(Colors.black),
            ),
            const SizedBox(height: 10),
            BaseRowTextDropdown(
              focusNode: _timeFocusNode,
              nexFocusNode: _loanReasonFocusNode,
              textInputAction: TextInputAction.done,
              labelText: 'Kỳ hạn mong muốn',
              hintText: "Nhập kỳ hạn mong muốn",
              controller: controller.tenureMonthsTextController,
              onSaved: (value) {
                try {
                  controller.tenureMonths = int.parse(value!.trim());
                } catch (e) {
                  controller.tenureMonths = 0;
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
              value: controller.loanReasonType.value,
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
              focusNode: _loanReasonFocusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              controller: controller.loanReasonTextController,
              labelText: 'Mô tả lý do vay',
              hintText: 'Mô tả lý do vay',
              onSaved: (value) {
                controller.loanReason = value!.trim();
              },
              validator: (value) => (value!.trim().isNotEmpty)
                  ? null
                  : 'Lý do không được rỗng'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
