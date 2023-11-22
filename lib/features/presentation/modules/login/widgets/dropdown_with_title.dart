import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';

class DropdownWithTitle extends StatelessWidget {
  DropdownWithTitle({
    required this.titleText,
    required this.weightField,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String titleText;
  final int weightField;
  final Function onChanged;
  final RxString value;

  /// data
  final List<DropdownMenuItem<String>> dropDownMenuItems = <String>['Nam', 'Nữ']
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: AppTextStyles.regular14.copyWith(color: AppColors.black)),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 5),
          child: Text(
            titleText,
            style: AppTextStyles.bold16.colorEx(AppColors.green),
          ),
        ),
        // field
        SizedBox(
          width: weightField.wp,
          child: Obx(() => DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 9, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                value: value.value,
                style: AppTextStyles.regular14.copyWith(color: AppColors.black),
                onChanged: (String? newValue) {
                  onChanged(newValue);
                },
                items: dropDownMenuItems,
                buttonStyleData: const ButtonStyleData(
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 400,
                ),
              )),
        ),
      ],
    );
  }
}
