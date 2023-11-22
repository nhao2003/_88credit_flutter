import 'package:get/get.dart';

extension PercentSized on int {
  double get hp => (Get.height * (this / 100));
  double get wp => (Get.width * (this / 100));
}

extension ResponsiveText on int {
  double get sp => (Get.width / 100 * (this / 3));
}
String formatMoney(int amount, {bool isLease = false}) {
  String suffix = '';
  if (isLease) {
    suffix = '/${'month'.tr}';
  }
  if (amount >= 1000000000) {
    double value = amount / 1000000000;
    return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 3)} ${'billion'.tr}$suffix';
  } else if (amount >= 1000000) {
    double value = amount / 1000000;
    return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 3)} ${'million'.tr}$suffix';
  } else {
    double value = amount / 1000;
    return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)} ${'thousand'.tr}$suffix';
  }
}

extension FormatMoneyExtension on int {
  String toFormattedMoney({bool isLease = false}) {
    return formatMoney(this, isLease: isLease);
  }
  String get formatNumberWithCommasK {
    if (this >= 1000000) {
      final tmp = (this~/1000).formatNumberWithCommas;
      return "${tmp}K";
    } else if (this >= 1000) {
      double value = this / 1000;
      return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}K';
    } else {
      return toString();
    }
  }
  String get formatNumberWithCommas {
    if (this >= 1000) {
      String strNumber = toString();
      String result = '';
      for (int i = strNumber.length - 1; i >= 0; i--) {
        result = strNumber[i] + result;
        if ((strNumber.length - i) % 3 == 0 && i > 0) {
          result = '.$result';
        }
      }
      return result;
    } else {
      return toString();
    }
  }
}
