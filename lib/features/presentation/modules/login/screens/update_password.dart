import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/login/screens/login_screen.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../../config/values/asset_image.dart';
import '../login_controller.dart';
import '../../../global_widgets/my_appbar.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final LoginController controller = Get.find<LoginController>();

  final _newpassFocusNode = FocusNode();
  final _reNewpassFocusNode = FocusNode();

  @override
  void dispose() {
    _newpassFocusNode.dispose();
    _reNewpassFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Quên mật khẩu"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 2.hp),
              // Logo
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Assets.forgotPassword,
                    width: 70.wp,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "NHAGIARE",
                    style: AppTextStyles.semiBold20.colorEx(AppColors.green),
                  ),
                ],
              ),
              const SizedBox(height: 30),
// text feild new password
              Obx(
                () => TextFormField(
                  focusNode: _newpassFocusNode,
                  textInputAction: TextInputAction.next,
                  controller: controller.newPasswordTextController,
                  obscureText: controller.isObscureResetPass.value,
                  keyboardType: TextInputType.visiblePassword,
                  autocorrect: false,
                  enableSuggestions: false,
                  style: AppTextStyles.regular14,
                  decoration: InputDecoration(
                      labelText: 'Mật khẩu mới'.tr,
                      hintText: 'Nhập mật khẩu mới'.tr,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 20.0),
                      suffixIcon: IconButton(
                        icon: Icon(
                          !controller.isObscureResetPass.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.green,
                        ),
                        onPressed: controller.toggleResetPass,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                  validator: (value) => (!(value == null || value == ''))
                      ? null
                      : 'Làm ơn nhập mật khẩu'.tr,
                  onTapOutside: (event) {
                    _newpassFocusNode.unfocus();
                  },
                  onFieldSubmitted: (_) {
                    // chuyen qua textfill tiep theo
                    FocusScope.of(context).requestFocus(_reNewpassFocusNode);
                  },
                ),
              ),
// text feild repeat password
              const SizedBox(height: 15),
              Obx(
                () => TextFormField(
                  focusNode: _reNewpassFocusNode,
                  textInputAction: TextInputAction.done,
                  controller: controller.reNewPasswordTextController,
                  obscureText: controller.isObscureRepeatPassReset.value,
                  keyboardType: TextInputType.visiblePassword,
                  autocorrect: false,
                  enableSuggestions: false,
                  style: AppTextStyles.regular14,
                  decoration: InputDecoration(
                      labelText: 'Nhập lại mật khẩu mới'.tr,
                      hintText: 'Nhập lại mật khẩu mới'.tr,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 20.0),
                      suffixIcon: IconButton(
                        icon: Icon(
                          !controller.isObscureRepeatPassReset.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.green,
                        ),
                        onPressed: controller.toggleRepeatPass,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                  validator: (value) {
                    if (value != controller.newPasswordTextController.text) {
                      return "Mật khẩu không khớp".tr;
                    }
                    return null;
                  },
                  onTapOutside: (event) {
                    _reNewpassFocusNode.unfocus();
                  },
                ),
              ),
              const SizedBox(height: 15),
              // button tiep tuc
              Obx(() => ElevatedButton(
                    onPressed: () {
                      Get.offAll(const LoginScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      textStyle: const TextStyle(color: AppColors.white),
                      minimumSize: Size(100.wp, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 10,
                    ),
                    child: controller.isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 2,
                            ))
                        : Text(
                            'Cập nhập lại mật khẩu'.tr,
                            style:
                                AppTextStyles.bold14.colorEx(AppColors.white),
                          ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
