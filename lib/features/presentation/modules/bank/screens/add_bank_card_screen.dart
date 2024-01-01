import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/bank/bank_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../../config/values/asset_image.dart';
import '../../../global_widgets/base_textfield.dart';

class AddBankCardScreen extends StatefulWidget {
  const AddBankCardScreen({super.key});

  @override
  State<AddBankCardScreen> createState() => _AddBankCardScreenState();
}

class _AddBankCardScreenState extends State<AddBankCardScreen> {
  final BankController controller = Get.find();

  final FocusNode _moneyFocusNode = FocusNode();

  @override
  void initState() {
    controller.cardNumberController.text = controller.selectedBank!.bin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Thêm thẻ ngân hàng"),
      body: ListView(
        children: [
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // avatar
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            child: CachedNetworkImage(
                              imageUrl: controller.selectedBank!.logo,
                              fit: BoxFit.contain,
                              width: 70,
                              height: 50,
                              errorWidget: (context, _, __) {
                                return const CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(Assets.avatar2),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Name
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.selectedBank!.shortName,
                                  style: AppTextStyles.bold14.colorEx(
                                    AppColors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  controller.selectedBank!.name,
                                  style: AppTextStyles.regular14.colorEx(
                                    AppColors.grey700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      BaseTextField(
                          focusNode: _moneyFocusNode,
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          controller: controller.cardNumberController,
                          labelText: 'Số thẻ/tài khoản',
                          hintText: "Nhập số thẻ/tài khoản",
                          onSaved: (value) {
                            try {
                              controller.cardNumber = value!.trim();
                            } catch (e) {
                              controller.cardNumber = "";
                            }
                          },
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Vui lòng nhập số thẻ/tài khoản";
                            }
                            // check card number
                            if (value.trim().length < 16) {
                              return "Số thẻ/tài khoản ít hơn 16 ký tự";
                            }
                            // validate all is number
                            if (!value.isNum) {
                              return "Số thẻ/tài khoản phải là số";
                            }
                            // check bank number is begin with bin
                            if (!value
                                .startsWith(controller.selectedBank!.bin)) {
                              return "Số thẻ/tài khoản phải bắt đầu bằng ${controller.selectedBank!.bin}";
                            }
                            return null;
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
          // thêm ngân hàng ============================================
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: controller.isLoadingAddBankCard.value
                    ? null
                    : () {
                        controller.addBankCard();
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
                child: controller.isLoadingAddBankCard.value
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        'Thêm thẻ ngân hàng'.tr,
                        style: AppTextStyles.bold14.colorEx(AppColors.white),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
