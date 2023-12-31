import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../config/theme/app_color.dart';
import '../../../../global_widgets/base_button.dart';
import '../../../../global_widgets/base_textfield.dart';
import '../../../../global_widgets/header_title.dart';

// ignore: must_be_immutable
class DialogCancel extends StatelessWidget {
  DialogCancel({
    required this.request,
    required this.handleRejectRequest,
    super.key,
  });

  final LoanRequestEntity request;
  final Function(LoanRequestEntity, String) handleRejectRequest;

  final TextEditingController textController = TextEditingController();

  final RxBool isLoading = false.obs;
  String reason = "";

  void onCancel() {
    Get.back();
    textController.clear();
  }

  void onAccept() async {
    await handleRejectRequest(request, reason);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      alignment: Alignment.center,
      contentPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeaderTitle(
              title: "Xác nhận yêu cầu hủy",
              paddingLeft: 0,
            ),
            const SizedBox(height: 20),
            BaseTextField(
              minLines: 3,
              maxLines: 10,
              maxLength: 1000,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              controller: textController,
              labelText: 'Lý do hủy',
              hintText: 'Mô tả lý do hủy',
              onSaved: (value) {
                reason = value!;
              },
              validator: (value) =>
                  (value!.trim().isNotEmpty) ? null : 'Mô tả không được rỗng',
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseButton(
                  title: "Hủy",
                  colorButton: AppColors.red,
                  width: 33.wp,
                  isLoading: isLoading,
                  onClick: onCancel,
                ),
                const SizedBox(width: 10),
                BaseButton(
                  title: "Lưu",
                  width: 33.wp,
                  isLoading: isLoading,
                  onClick: onAccept,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
