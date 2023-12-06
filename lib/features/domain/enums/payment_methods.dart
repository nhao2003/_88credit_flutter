enum PaymentMethods {
  zaloPay;

  String get value {
    switch (this) {
      case PaymentMethods.zaloPay:
        return 'zalo_pay';
      default:
        return 'zalo_pay';
    }
  }

  static PaymentMethods fromString(String value) {
    switch (value) {
      case 'zalo_pay':
        return PaymentMethods.zaloPay;
      default:
        return PaymentMethods.zaloPay;
    }
  }

  @override
  String toString() {
    switch (this) {
      case PaymentMethods.zaloPay:
        return 'zalo_pay';
      default:
        return 'zalo_pay';
    }
  }
}
