import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../../core/extensions/string_ex.dart';
import '../login_controller.dart';
import '../widgets/image_logo.dart';
import '../../../global_widgets/my_appbar.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final LoginController controller = Get.find<LoginController>();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _rePasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _rePasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Đăng ký"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: controller.registerFormGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              const ImageLogo(),
              // text field email
              Obx(() => TextFormField(
                    focusNode: _emailFocusNode,
                    controller: controller.registerEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: AppTextStyles.regular14,
                    decoration: InputDecoration(
                      hintText: 'Email'.tr,
                      labelText: 'Nhập Email',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 20.0),
                      errorText: (controller.registerError.value == '')
                          ? null
                          : controller.registerError.value,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: (value) =>
                        (value!.isEmail) ? null : 'Email không hợp lệ'.tr,
                    onTapOutside: (event) {
                      _emailFocusNode.unfocus();
                    },
                    onFieldSubmitted: (_) {
                      // chuyen qua textfill tiep theo
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                  )),
              const SizedBox(height: 15),
              Obx(() => TextFormField(
                    focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    controller: controller.registerPassword,
                    obscureText: controller.isObscureRegister.value,
                    style: AppTextStyles.regular14,
                    autocorrect: false,
                    enableSuggestions: false,
                    onChanged: (value) {
                      controller.checkCanShowValidator(value);
                    },
                    decoration: InputDecoration(
                        hintText: 'Mật khẩu'.tr,
                        labelText: 'Nhập mật khẩu'.tr,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18.0, horizontal: 20.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            !controller.isObscureRegister.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.green,
                          ),
                          onPressed: controller.togglePassReg,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Mật khẩu không được để trống'.tr;
                      }
                      return null;
                    },
                    onTapOutside: (event) {
                      _passwordFocusNode.unfocus();
                    },
                    onFieldSubmitted: (_) {
                      // chuyen qua textfill tiep theo
                      FocusScope.of(context).requestFocus(_rePasswordFocusNode);
                    },
                  )),
              const SizedBox(height: 10),
              Obx(
                () => Visibility(
                  visible: controller.validatorVisibility.value,
                  child: FlutterPwValidator(
                      controller: controller.registerPassword,
                      strings: ValidateString(),
                      minLength: 8,
                      successColor: AppColors.green,
                      failureColor: AppColors.red,
                      uppercaseCharCount: 1,
                      lowercaseCharCount: 1,
                      specialCharCount: 1,
                      numericCharCount: 1,
                      width: 400,
                      height: 180,
                      onSuccess: () {
                        controller.hideValidator();
                        controller.validatorSusscess.value = true;
                      },
                      onFail: () {
                        controller.showValidator();
                        controller.validatorSusscess.value = false;
                      }),
                ),
              ),
              const SizedBox(height: 5),
              Obx(() => TextFormField(
                    focusNode: _rePasswordFocusNode,
                    textInputAction: TextInputAction.done,
                    controller: controller.registerRepeatPassword,
                    obscureText: controller.isObscureRepeatPass.value,
                    autocorrect: false,
                    enableSuggestions: false,
                    style: AppTextStyles.regular14,
                    decoration: InputDecoration(
                        hintText: 'Nhập lại mật khẩu'.tr,
                        labelText: 'Nhập lại mật khẩu'.tr,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18.0, horizontal: 20.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            !controller.isObscureRepeatPass.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.green,
                          ),
                          onPressed: controller.toggleRepeatPassReg,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Mật khẩu không được để trống'.tr;
                      } else if (value !=
                          controller.registerRepeatPassword.text) {
                        return "Mật khẩu không khớp".tr;
                      }
                      return null;
                    },
                    onTapOutside: (event) {
                      _rePasswordFocusNode.unfocus();
                    },
                  )),
              const SizedBox(height: 20),
              // Button register
              Obx(() => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            controller.handleRegister();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      textStyle: const TextStyle(color: AppColors.white),
                      elevation: 10,
                      minimumSize: Size(100.wp, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ))
                        : Text(
                            'Đăng ký'.tr,
                            style:
                                AppTextStyles.bold14.colorEx(AppColors.white),
                          ),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Đã có tài khoản? "),
                  TextButton(
                      onPressed: () async {
                        Get.offAll(const LoginScreen());
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                      ),
                      child: Text('Đăng nhập'.tr)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
