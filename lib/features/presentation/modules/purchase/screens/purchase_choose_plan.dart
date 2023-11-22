import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/domain/entities/purchase/membership_package.dart';
import 'package:_88credit_flutter/features/presentation/modules/purchase/purchase_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/purchase/screens/purchase_payment_result_screen.dart';

class PurchaseChoosePlanScreen extends StatelessWidget {
  final MembershipPackageEntity package = Get.arguments;

  PurchaseChoosePlanScreen({Key? key}) : super(key: key);

  final PurchaseController controller = Get.find<PurchaseController>();
  final RxInt selectedRadio = (-1).obs;
  final RxBool isEnableButtom = true.obs;
  final List<int> months = [1, 3, 6, 12];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(package.name),
      ),
      bottomSheet: FractionallySizedBox(
        widthFactor: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Obx(() => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                ),
                onPressed: (selectedRadio.value != -1 && isEnableButtom.value)
                    ? () async {
                        CreateOrderResult res = await controller.createOrder(
                            package.id, months[selectedRadio.value]);
                        isEnableButtom.value = false;
                        if (res.isCreateSuccess) {
                          Get.to(() => const PurchasePaymentResultScreen(),
                              arguments: res.appTransId);
                        } else {
                          Get.snackbar(
                            "Lỗi",
                            res.message!,
                            backgroundColor: AppColors.red,
                            colorText: AppColors.white,
                          );
                          isEnableButtom.value = true;
                        }
                      }
                    : null,
                child: const Text(
                  "Mua ngay",
                  style: TextStyle(color: AppColors.white),
                ),
              )),
        ),
      ),
      body: ListView.builder(
        itemCount: months.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Obx(() {
              return ListTile(
                tileColor: selectedRadio.value == index
                    ? AppColors.green.withOpacity(0.15)
                    : null,
                onTap: () {
                  selectedRadio.value = index;
                },
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: AppColors.green,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                leading: Radio(
                  fillColor: MaterialStateProperty.resolveWith(
                    (states) => AppColors.green,
                  ),
                  value: index,
                  groupValue: selectedRadio.value,
                  onChanged: (val) {
                    selectedRadio.value = val as int;
                  },
                ),
                title: Text(
                  "Gói ${months[index]} tháng",
                  style: AppTextStyles.bold16.colorEx(AppColors.green),
                ),
                subtitle: Text(
                  "${(package.pricePerMonth * months[index]).toInt().formatNumberWithCommas}đ",
                  style: AppTextStyles.regular14,
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
