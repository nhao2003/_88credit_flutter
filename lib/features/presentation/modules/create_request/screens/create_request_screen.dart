import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail/credit_card.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/detail/user_card.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_request/widgets/images_form.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_request/widgets/loan_info_form.dart';
import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../create_request_controler.dart';

class CreateRequestScreen extends StatelessWidget {
  CreateRequestScreen({super.key});

  final CreateRequestController controller = CreateRequestController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Tạo yêu cầu vay"),
      body: ListView(
        children: [
          Form(
            key: controller.requestFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: UserCard(
                    title: "Người cho vay",
                    name: controller.receiver.fullName,
                    navToProfile: () {},
                    avatar: controller.receiver.avatar,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: CreditCard(
                    bankName: "Agribank",
                    bankNumber: "1233456789",
                    hanleChooseCard: () {},
                    buttonText: "Đổi thẻ",
                  ),
                ),
                // Thong tin bai dang
                LoanInfoForm(
                  isvisible: true,
                  controller: controller,
                ),
                // images
                ImagesForm(
                  isvisible: true,
                  controller: controller,
                ),
                // dang bai ============================================
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            controller.createRequest();
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
                            ),
                          )
                        : Text(
                            'Tạo yêu cầu'.tr,
                            style:
                                AppTextStyles.bold14.colorEx(AppColors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
