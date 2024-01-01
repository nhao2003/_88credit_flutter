import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/features/presentation/modules/pdf_view/pdf_viewer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/loading_component.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/not_identity_card.dart';
import 'package:_88credit_flutter/features/presentation/modules/account/account_controller.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/values/asset_image.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  final AccountController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.servicePack = 1;
    return Scaffold(
      appBar: MyAppbar(title: "Tài khoản", isShowBack: false, actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Image.asset(
            Assets.chat,
            width: 25,
            height: 25,
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: ListTile.divideTiles(
            color: AppColors.grey100,
            context: context,
            tiles: [
              // account
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Phan Văn Minh',
                          style: AppTextStyles.medium16,
                        ),
                        const SizedBox(width: 2),
                        if (controller.isIdentity)
                          Image.asset(
                            Assets.badge,
                            height: 15,
                            width: 15,
                          ),
                      ],
                    ),
                    if (!controller.isIdentity) const NotIdentityCard(),
                  ],
                ),
                onTap: () {},
                leading: const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(Assets.avatarDefault),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ),
              // favorite
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                title: Text(
                  'Đã lưu',
                  style: AppTextStyles.medium16,
                ),
                onTap: () {},
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.red,
                    size: 25,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ),
              // purchase
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gói dịch vụ',
                      style: AppTextStyles.medium16,
                    ),
                    const SizedBox(height: 2),
                    if (controller.servicePack != 0)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: controller.servicePack == 1
                              ? AppColors.green100
                              : controller.servicePack == 2
                                  ? AppColors.blue100
                                  : AppColors.red100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          controller.servicePack == 1
                              ? "Gói cơ bản"
                              : controller.servicePack == 2
                                  ? "Gói chuyên nghiệp"
                                  : "Gói doanh nghiệp",
                          style: AppTextStyles.medium12
                              .colorEx(controller.servicePack == 1
                                  ? AppColors.green800
                                  : controller.servicePack == 2
                                      ? AppColors.blue800
                                      : AppColors.red),
                        ),
                      )
                  ],
                ),
                onTap: () {
                  controller.navToPurchase();
                },
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(
                    Assets.archive,
                    height: 25,
                    color: AppColors.black,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                title: Text(
                  'Quản lý bài đăng',
                  style: AppTextStyles.medium16,
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.postManagement);
                },
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(
                    Assets.chart,
                    height: 25,
                    color: AppColors.black,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                title: Text(
                  'Quản lý thẻ ngân hàng',
                  style: AppTextStyles.medium16,
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.bank);
                },
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.credit_card,
                    color: AppColors.black,
                    size: 25,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ),
              // update info
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                title: Text(
                  'Cập nhập thông tin',
                  style: AppTextStyles.medium16,
                ),
                onTap: () {},
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.edit_outlined,
                    color: AppColors.black,
                    size: 25,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ),
              // change Password
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                title: Text(
                  'Đổi mật khẩu',
                  style: AppTextStyles.medium16,
                ),
                onTap: () {},
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.black,
                    size: 25,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ),
              // change language
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                title: Text(
                  'Ngôn ngữ',
                  style: AppTextStyles.medium16,
                ),
                onTap: () {},
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.language_outlined,
                    color: AppColors.black,
                    size: 25,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ),
              // logout
              Obx(() => ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                    title: controller.isLoadingLogout.value
                        ? const LoadingComponent(color: AppColors.red)
                        : Text(
                            'Đăng xuất',
                            style:
                                AppTextStyles.medium16.colorEx(AppColors.red),
                          ),
                    onTap: () {
                      controller.handleSignOut();
                    },
                    leading: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.logout,
                        color: AppColors.red,
                        size: 25,
                      ),
                    ),
                  )),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                title: Text(
                  'PDF',
                  style: AppTextStyles.medium16,
                ),
                onTap: () {
                  Get.to(() => const PdfViewerScreen(
                        createdDay: '1',
                        createdMonth: '1',
                        createdYear: '2023',
                        lenderName: 'John Doe',
                        lenderDob: '01/01/1980',
                        lenderIdCardNumber: '123456789',
                        lenderIdCardIssuedBy: 'Local Authority',
                        lenderIdCardIssuedAt: '01/01/2000',
                        lenderPermanentResidence: '123 Main Street, City',
                        lenderPhoneNumber: '123-456-7890',
                        lenderBankName: 'Sample Bank',
                        lenderBankAccountNumber: '987654321',
                        lenderBankBranch: 'Main Branch',
                        borrowerName: 'Jane Doe',
                        borrowerDob: '02/02/1990',
                        borrowerIdCardNumber: '987654321',
                        borrowerIdCardIssuedBy: 'City Authority',
                        borrowerIdCardIssuedAt: '02/02/2005',
                        borrowerPermanentResidence: '456 Oak Street, Town',
                        borrowerPhoneNumber: '987-654-3210',
                        borrowerBankName: 'Another Bank',
                        borrowerBankAccountNumber: '1234567890',
                        borrowerBankBranch: 'Branch A',
                        amount: '10000.0',
                        amountInWords: 'Ten thousand dollars',
                        loanReason: 'Home improvement',
                        tenureInMonths: '12',
                        createdAt: '01/01/2021',
                        expiredAt: '01/01/2022',
                        transferDate: '01/01/2021',
                        interestRate: '5.0',
                        overdueInterestRate: '10.0',
                      ));
                },
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.login,
                    color: AppColors.black,
                    size: 25,
                  ),
                ),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
