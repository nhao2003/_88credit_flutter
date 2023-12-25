class ConverNumber {
  static double convertIntToDouble(dynamic number) {
    if (number is int) {
      return number.toDouble();
    } else if (number is double) {
      return number;
    } else {
      throw ArgumentError('Input must be either int or double');
    }
  }
}
