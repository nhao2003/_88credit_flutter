import 'package:get/get.dart';

extension PercentSized on double {
  double get hp => (Get.height * (this / 100));
  double get wp => (Get.width * (this / 100));
}

extension ResponsiveText on double {
  double get sp => (Get.width / 100 * (this / 3));
}

String formatMoney(double amount) {

  if (amount >= 1000000000) {
    double value = amount / 1000000000;
    return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 3)} tỷ/m2';
  } else if (amount >= 1000000) {
    double value = amount / 1000000;
    return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 3)} triệu/m2';
  } else {
    double value = amount / 1000;
    return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)} nghìn/m2';
  }
}

extension FormatMoneyExtension on double {
  String toFormattedMoney() {
    return formatMoney(this);
  }
}
