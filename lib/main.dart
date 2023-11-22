import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/routes/app_pages.dart';
import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/config/values/app_string.dart';
import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/features/domain/usecases/authentication/check_token.dart';
import 'package:_88credit_flutter/injection_container.dart';
import 'config/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  bool isLogin = await checkIsLogin();
  runApp(MyApp(isLogin: isLogin));
}

Future<bool> checkIsLogin() async {
  bool isLogin = false;
  CheckTokenUseCase checkTokenUseCase = sl<CheckTokenUseCase>();
  final dataState = await checkTokenUseCase();
  if (dataState is DataSuccess && dataState.data == true) isLogin = true;
  return isLogin;
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({required this.isLogin, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // khong cho man hinh xoay ngang
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      defaultTransition: Transition.cupertino,
      initialRoute: isLogin ? AppRoutes.bottomBar : AppRoutes.login,
      getPages: AppPages.pages,
    );
  }
}
