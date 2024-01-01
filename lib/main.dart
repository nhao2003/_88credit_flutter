import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/routes/app_pages.dart';
import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/config/values/app_string.dart';
import 'package:_88credit_flutter/injection_container.dart';
import 'config/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.pages,
      builder: EasyLoading.init(),
    );
  }
}
