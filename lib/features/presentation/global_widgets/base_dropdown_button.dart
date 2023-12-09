import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:flutter/material.dart';
import '../../../config/theme/app_color.dart';
import '../../../config/theme/text_styles.dart';

class BaseDropdownButton extends StatelessWidget {
  const BaseDropdownButton({
    super.key,
    this.title,
    this.width,
    this.isSetSelectedItemBuilder = false,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.onSaved,
    this.selectedItemBuilder,
  });

  final bool isSetSelectedItemBuilder;
  final double? width;
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
                return SizedBox(
                  width: width != null ? width! - 12.wp : null,
                  child: item.child,
                );
              }).toList();
            }
          : null,
      value: value,
      hint: SizedBox(
          width: width != null ? width! - 12.wp : null,
          child: Text(
            hint,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
      items: items,
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}
