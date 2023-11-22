import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String toHMDMYString() {
    var outputFormat = DateFormat('HH:mm dd/MM/yyyy');
    return outputFormat.format(this);
  }

  String toDMYString() {
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(this);
  }

  /// get num of date between dateFrom to DateTo
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  String get fommatDateTZ {
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(this);
    return formattedDate;
  }

  /// get string day before
  String get dayBeforeString {
    int days = daysBetween(this, DateTime.now());
    if (days == 0) return "Today".tr;
    if (days == 1) return "Yesterday".tr;
    if (days <= 30) return "$days ${"days ago".tr}";
    if (days > 30) {
      if (days ~/ 30 == 1) return "1 month ago".tr;
      if (days ~/ 30 > 1 && days <= 365) {
        return "${days ~/ 30} ${"months ago".tr}";
      }
    }
    if (days > 365) {
      if (days ~/ 365 == 1) return "1 year ago".tr;
      return "${days ~/ 365} ${"years ago".tr}";
    }
    return "$days ${"days ago".tr}";
  }

  // get time has passed since post
  String getTimeAgo() {
    Duration difference = DateTime.now().difference(this);

    if (difference.inDays >= 365) {
      int years = (difference.inDays / 365).floor();
      return '${years.toString()} ${'year${years > 1 ? 's' : ''}'.tr} ${'ago'.tr}';
    } else if (difference.inDays >= 30) {
      int months = (difference.inDays / 30).floor();
      return '${months.toString()} ${'month${months > 1 ? 's' : ''}'.tr} ${'ago'.tr}';
    } else if (difference.inDays >= 1) {
      if (difference.inDays == 1) {
        return 'Yesterday'.tr;
      } else {
        return '${difference.inDays.toString()} ${'day${difference.inDays > 1 ? 's' : ''}'.tr} ${'ago'.tr}';
      }
    } else if (difference.inHours >= 1) {
      return '${difference.inHours.toString()} ${'hour${difference.inHours > 1 ? 's' : ''}'.tr} ${'ago'.tr}';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes.toString()} ${'minute${difference.inMinutes > 1 ? 's' : ''}'.tr} ${'ago'.tr}';
    } else {
      return 'Just now'.tr;
    }
  }

  String getTimeAgoVi() {
    Duration difference = DateTime.now().difference(this);

    if (difference.inDays >= 365) {
      int years = (difference.inDays / 365).floor();
      return '${years.toString()} ${'năm${years > 1 ? '' : ''}'.tr} ${'trước'.tr}';
    } else if (difference.inDays >= 30) {
      int months = (difference.inDays / 30).floor();
      return '${months.toString()} ${'tháng${months > 1 ? '' : ''}'.tr} ${'trước'.tr}';
    } else if (difference.inDays >= 1) {
      if (difference.inDays == 1) {
        return 'Hôm qua'.tr;
      } else {
        return '${difference.inDays.toString()} ${'ngày${difference.inDays > 1 ? '' : ''}'.tr} ${'trước'.tr}';
      }
    } else if (difference.inHours >= 1) {
      return '${difference.inHours.toString()} ${'giờ${difference.inHours > 1 ? '' : ''}'.tr} ${'trước'.tr}';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes.toString()} ${'phút${difference.inMinutes > 1 ? '' : ''}'.tr} ${'trước'.tr}';
    } else {
      return 'Bây giờ'.tr;
    }
  }

  /// get the first, second, third, fourth and fifth week of the month
  int get getWeekOfDateInMonth {
    return day % 7 + 1;
  }
}
