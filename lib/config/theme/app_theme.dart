import 'package:flutter/material.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    //fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green),
    useMaterial3: true,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: AppColors.black),
    titleTextStyle: AppTextStyles.semiBold18.colorEx(AppColors.green),
  );
}
