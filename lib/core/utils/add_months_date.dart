class AddMonthDate {
  static DateTime addMonthsToDateTime(DateTime dateTime, int monthsToAdd) {
    if (monthsToAdd == 0) {
      return dateTime;
    }

    // Tính toán năm và tháng mới
    int newYear = dateTime.year + monthsToAdd ~/ 12;
    int newMonth = (dateTime.month + monthsToAdd % 12) % 12;
    if (newMonth == 0) {
      newMonth = 12;
    }

    // Tạo đối tượng DateTime mới
    DateTime newDateTime = DateTime(
        newYear,
        newMonth,
        dateTime.day,
        dateTime.hour,
        dateTime.minute,
        dateTime.second,
        dateTime.millisecond,
        dateTime.microsecond);
    return newDateTime;
  }
}
