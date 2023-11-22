import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({
    this.region,
    required this.titleText,
    required this.hintText,
    required this.weightField,
    required this.keyBoardType,
    required this.focusNode,
    required this.enable,
    required this.canTap,
    this.nexFocusNode,
    required this.textController,
    required this.validateFunc,
    this.onTap,
    super.key,
  });

  final String? region;
  final bool enable;
  final bool canTap;
  final String titleText;
  final String hintText;
  final int weightField;
  final TextInputType keyBoardType;
  final FocusNode focusNode;
  final FocusNode? nexFocusNode;
  final TextEditingController textController;
  final Function validateFunc;
  final Function? onTap;

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
        Row(
          children: [
            if (region != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  region!,
                  style: AppTextStyles.regular16.colorEx(AppColors.green),
                ),
              ),
            SizedBox(
              width: weightField.wp,
              child: TextFormField(
                enabled: enable,
                focusNode: focusNode,
                controller: textController,
                keyboardType: keyBoardType,
                readOnly: !canTap,
                textInputAction: TextInputAction.next,
                style: AppTextStyles.regular14,
                inputFormatters: keyBoardType == TextInputType.phone
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ]
                    : null,
                decoration: InputDecoration(
                  hintText: hintText,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 20.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  filled: !enable,
                  fillColor: enable ? AppColors.white : AppColors.grey100,
                  suffixIcon: !canTap
                      ? const Icon(
                          Icons.calendar_month,
                          color: AppColors.grey300,
                        )
                      : null,
                ),
                validator: (value) => validateFunc(value),
                onTapOutside: (event) {
                  focusNode.unfocus();
                },
                onFieldSubmitted: (_) {
                  // chuyen qua textfill tiep theo
                  FocusScope.of(context).requestFocus(nexFocusNode);
                },
                onTap: onTap as void Function()?,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
