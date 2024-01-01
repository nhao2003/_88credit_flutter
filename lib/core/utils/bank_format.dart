class BankFormat {
  static String formatCardNumber(String value) {
    // 1234 5678 9012 3456

    if (value.length < 16) {
      return value;
    }

    final first = value.substring(0, 4);
    final second = value.substring(4, 8);
    final third = value.substring(8, 12);
    final fourth = value.substring(12, 16);

    return '$first $second $third $fourth';
  }
}
