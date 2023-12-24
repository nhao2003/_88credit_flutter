import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:flutter/material.dart';
import '../../../global_widgets/base_dropdown_button.dart';
import '../../../global_widgets/base_textfield.dart';

class BaseRowTextDropdown extends StatelessWidget {
  const BaseRowTextDropdown({
    required this.focusNode,
    required this.nexFocusNode,
    required this.textInputAction,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.onSaved,
    required this.timeValue,
    required this.onChangeTimeValue,
    this.validator,
    super.key,
  });

  final FocusNode? focusNode;
  final FocusNode? nexFocusNode;
  final TextInputAction? textInputAction;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final void Function(String?) onSaved;
  final String timeValue;
  final void Function(String?) onChangeTimeValue;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 52.wp,
          child: BaseTextField(
            focusNode: focusNode,
            nexFocusNode: nexFocusNode,
            maxLines: 1,
            keyboardType: TextInputType.number,
            textInputAction: textInputAction,
            controller: controller,
            labelText: labelText,
            hintText: hintText,
            onSaved: onSaved,
            validator: validator,
          ),
        ),
        SizedBox(
          width: 25.wp,
          child: BaseDropdownButton(
            title: "Đơn vị",
            hint: "Tháng",
            width: 25.wp,
            isSetSelectedItemBuilder: true,
            value: timeValue,
            items: ["Tháng", "Năm"].map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.visible,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                onChangeTimeValue(value as String);
              }
            },
            onSaved: (value) {
              if (value == null) return;
              onChangeTimeValue(value as String);
            },
          ),
        ),
      ],
    );
  }
}
