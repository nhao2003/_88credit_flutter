import 'package:_88credit_flutter/features/domain/entities/credit/user.dart';
import 'package:_88credit_flutter/features/domain/usecases/user/get_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/features/domain/usecases/authentication/sign_out.dart';
import 'package:_88credit_flutter/injection_container.dart';

import '../../../../config/theme/app_color.dart';

class AccountController extends GetxController {
  bool isIdentity = true;
  RxBool isLoadingLogout = false.obs;
  int servicePack = 1;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  GetProfileUseCase get _getProfileUseCase => sl<GetProfileUseCase>();
  Rxn<UserEntity> me = Rxn<UserEntity>(null);

  Future<void> getProfile() async {
    me.value = await _getProfileUseCase();
  }

  navigateToProfile() {
    Get.toNamed(AppRoutes.userProfile, arguments: me.value);
  }

  void changeServicePack(int value) {
    servicePack = value;
    update();
  }

  void navToPurchase() {
    Get.toNamed(AppRoutes.purchase);
  }

  Future<void> handleSignOut() async {
    try {
      isLoadingLogout.value = true;
      SignOutUseCase signOutUseCase = sl<SignOutUseCase>();
      final dataState = await signOutUseCase();
      isLoadingLogout.value = false;
      if (dataState is DataSuccess) {
        Get.offAllNamed(AppRoutes.login);
        Get.snackbar(
          'Thành công',
          'Đăng xuất thành công',
          backgroundColor: AppColors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Đăng xuất thất bại',
          (dataState as DataFailed).error.toString(),
          backgroundColor: AppColors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Đăng xuất thất bại',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      isLoadingLogout.value = false;
    }
  }
}
