import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:flutter/material.dart';
import '../../../config/theme/text_styles.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    this.focusNode,
    this.nexFocusNode,
    required this.controller,
    this.keyboardType,
    this.textInputAction,
    this.minLines,
    this.maxLines,
    this.maxLength,
    required this.labelText,
    required this.hintText,
    this.validator,
    required this.onSaved,
    this.onChanged,
    super.key,
  });

  final FocusNode? focusNode;
  final FocusNode? nexFocusNode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      minLines: minLines,
      maxLength: maxLength,
      style: AppTextStyles.regular14.colorEx(Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        filled: true,
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onTapOutside: (event) {
        if (focusNode != null) focusNode!.unfocus();
      },
      onSaved: onSaved,
      onChanged: (value) {
        onSaved!(value);
      },
      onFieldSubmitted: (value) {
        onSaved!(value);
        FocusScope.of(context).requestFocus(nexFocusNode);
      },
      validator: validator,
    );
  }
}
