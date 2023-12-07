import 'package:get/get.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../injection_container.dart';
import '../../../domain/usecases/authentication/check_token.dart';

class SplashController extends GetxController {
  Future<bool> _checkIsLogin() async {
    bool isLogin = false;
    CheckTokenUseCase checkTokenUseCase = sl<CheckTokenUseCase>();
    final dataState = await checkTokenUseCase();
    if (dataState is DataSuccess && dataState.data == true) isLogin = true;
    return isLogin;
  }
  void checkLogin() {
    _checkIsLogin().then((value) {
      if (value) {
        Get.offAllNamed(AppRoutes.bottomBar);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    });
  }
}
