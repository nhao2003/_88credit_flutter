import 'package:flutter/material.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import '../../../config/theme/app_color.dart';
import '../../../config/theme/text_styles.dart';

class BaseDropdownButton extends StatelessWidget {
  const BaseDropdownButton({
    super.key,
    this.title,
    this.isSetSelectedItemBuilder = false,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.onSaved,
    this.selectedItemBuilder,
  });

  final bool isSetSelectedItemBuilder;
  final Object? value;
  final List<DropdownMenuItem<Object>>? items;
  final String? title;
  final String hint;
  final Function(Object?)? onChanged;
  final Function(Object?)? onSaved;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: AppColors.green),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: isSetSelectedItemBuilder ? 10 : 20, vertical: 15),
        filled: true,
        fillColor: AppColors.white,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: title,
      ),
      style: AppTextStyles.regular14.colorEx(Colors.black),
      dropdownColor: AppColors.white,
      selectedItemBuilder: isSetSelectedItemBuilder
          ? (context) {
              return items!.map<Widget>((item) {
                return Container(
                  child: item.child,
                );
              }).toList();
            }
          : null,
      value: value,
      hint: Text(hint),
      items: items,
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}
