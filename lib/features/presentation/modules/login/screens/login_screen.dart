import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/login/widgets/image_logo.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../config/theme/text_styles.dart';
import '../login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.find<LoginController>();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    controller.loginEmail.text = "user@example.com";
    controller.loginPassword.text = "haonek2003";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: "Đăng nhập",
        isShowBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: controller.loginFormGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5.hp),
              // Logo
              const ImageLogo(),
              // Text file Email
              Obx(() => TextFormField(
                    focusNode: _emailFocusNode,
                    controller: controller.loginEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: AppTextStyles.regular14,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Nhập Email'.tr,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18.0, horizontal: 20.0),
                        errorText: (controller.loginError.value == '')
                            ? null
                            : controller.loginError.value,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                    validator: (value) =>
                        (value!.isEmail) ? null : 'Invalid email address'.tr,
                    onTapOutside: (event) {
                      _emailFocusNode.unfocus();
                    },
                    onFieldSubmitted: (_) {
                      // chuyen qua textfill tiep theo
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                  )),
              const SizedBox(height: 15),
              // text field password
              Obx(
                () => TextFormField(
                  focusNode: _passwordFocusNode,
                  textInputAction: TextInputAction.done,
                  controller: controller.loginPassword,
                  obscureText: controller.isObscureLogin.value,
                  autocorrect: false,
                  enableSuggestions: false,
                  style: AppTextStyles.regular14,
                  decoration: InputDecoration(
                      labelText: 'Mật khẩu'.tr,
                      hintText: 'Nhập mật khẩu'.tr,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 20.0),
                      suffixIcon: IconButton(
                        icon: Icon(
                          !controller.isObscureLogin.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.green,
                        ),
                        onPressed: controller.togglePassword,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                  validator: (value) => (!(value == null || value == ''))
                      ? null
                      : 'Làm ơn nhập mật khẩu'.tr,
                  onTapOutside: (event) {
                    _passwordFocusNode.unfocus();
                  },
                ),
              ),

              // quen mat khau
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.fogot);
                      },
                      child: Text('Quên mật khẩu?'.tr)),
                ],
              ),

              // button login
              Obx(() => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            controller.handleLogin();
                            //Get.toNamed(AppRoutes.bottomBar);
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
                            'Đăng nhập'.tr,
                            style:
                                AppTextStyles.bold14.colorEx(AppColors.white),
                          ),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Chưa có tài khoản? "),
                  TextButton(
                      onPressed: () async {
                        Get.toNamed(AppRoutes.register);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                      ),
                      child: Text('Đăng ký ngay'.tr)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
