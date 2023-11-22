import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/login/widgets/dropdown_with_title.dart';
import 'package:_88credit_flutter/features/presentation/modules/login/widgets/image_avatar_picker.dart';
import 'package:_88credit_flutter/features/presentation/modules/login/widgets/text_field_with_title.dart';
import '../../../../../config/routes/app_routes.dart';
import '../login_controller.dart';
import '../../../global_widgets/my_appbar.dart';

class UpdateInfoScreen extends StatefulWidget {
  const UpdateInfoScreen({super.key});

  @override
  State<UpdateInfoScreen> createState() => _UpdateInfoScreenState();
}

class _UpdateInfoScreenState extends State<UpdateInfoScreen> {
  final LoginController controller = Get.find<LoginController>();

  final _fnameFocusNode = FocusNode();
  final _lnameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _birthFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();

  @override
  void dispose() {
    _fnameFocusNode.dispose();
    _lnameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _addressFocusNode.dispose();
    _birthFocusNode.dispose();
    super.dispose();
  }

  String getEmail() {
    return "minhphan46@gmail.com";
  }

  @override
  Widget build(BuildContext context) {
    controller.emailUpdateInfoTextController.text = getEmail();

    return Scaffold(
      appBar: MyAppbar(title: "Cập nhập thông tin"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: controller.updateInfoFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
// image avatar
              const ImageAvatarPicker(),
              const SizedBox(height: 12),
// text avatar
              Center(
                child: Text(
                  "Thay đổi ảnh đại diện",
                  style: AppTextStyles.bold16.colorEx(AppColors.green),
                ),
              ),
// text field Ho & ten
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldWithTitle(
                    titleText: "Họ",
                    hintText: "Nhập họ",
                    enable: true,
                    canTap: true,
                    keyBoardType: TextInputType.name,
                    focusNode: _lnameFocusNode,
                    nexFocusNode: _fnameFocusNode,
                    textController: controller.lnameUpdateInfoTextController,
                    weightField: 30,
                    validateFunc: (value) => (!(value == null || value == ''))
                        ? null
                        : 'Làm ơn nhập họ'.tr,
                  ),
                  TextFieldWithTitle(
                    titleText: "Tên",
                    hintText: "Nhập tên",
                    enable: true,
                    canTap: true,
                    keyBoardType: TextInputType.name,
                    focusNode: _fnameFocusNode,
                    nexFocusNode: _phoneFocusNode,
                    textController: controller.fnamUpdateInfoTextController,
                    weightField: 52,
                    validateFunc: (value) => (!(value == null || value == ''))
                        ? null
                        : 'Làm ơn nhập tên'.tr,
                  ),
                ],
              ),
// text field so dien thoai
              const SizedBox(height: 12),
              TextFieldWithTitle(
                region: "+84",
                titleText: "Số điện thoại",
                hintText: "Nhập số điện thoại",
                enable: true,
                canTap: true,
                keyBoardType: TextInputType.phone,
                focusNode: _phoneFocusNode,
                textController: controller.phoneUpdateInfoTextController,
                weightField: 70,
                validateFunc: (value) => (!(value == null || value == ''))
                    ? null
                    : 'Làm ơn nhập số điện thoại'.tr,
              ),
// text field email
              const SizedBox(height: 12),
              TextFieldWithTitle(
                titleText: "Email",
                hintText: "Nhập email",
                enable: false,
                canTap: true,
                keyBoardType: TextInputType.emailAddress,
                focusNode: _emailFocusNode,
                textController: controller.emailUpdateInfoTextController,
                weightField: 85,
                validateFunc: () {},
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
// text field date of birth
                  TextFieldWithTitle(
                    titleText: "Ngày sinh",
                    hintText: "Nhập ngày sinh",
                    enable: true,
                    canTap: false,
                    keyBoardType: TextInputType.datetime,
                    focusNode: _birthFocusNode,
                    textController: controller.birthUpdateInfoTextController,
                    weightField: 50,
                    validateFunc: () {},
                    onTap: controller.handleDatePicker,
                  ),
// drop down button gender
                  DropdownWithTitle(
                    titleText: "Giới tính",
                    weightField: 32,
                    value: controller.gender,
                    onChanged: controller.changeGender,
                  )
                ],
              ),
// text field address
              const SizedBox(height: 12),
              TextFieldWithTitle(
                titleText: "Địa chỉ",
                hintText: "Nhập địa chỉ",
                enable: true,
                canTap: true,
                keyBoardType: TextInputType.streetAddress,
                focusNode: _addressFocusNode,
                textController: controller.addressUpdateInfoTextController,
                weightField: 85,
                validateFunc: (value) => (!(value == null || value == ''))
                    ? null
                    : 'Làm ơn nhập địa chỉ của bạn'.tr,
              ),
// Button luu
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: () {
                  controller.handleRegister();
                  Get.toNamed(AppRoutes.bottomBar);
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
                          color: Colors.black,
                          strokeWidth: 2,
                        ))
                    : Text(
                        'Lưu'.tr,
                        style: AppTextStyles.bold14.colorEx(AppColors.white),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
