enum OTPTypes {
  accountActivation,
  passwordRecovery;

  static OTPTypes parse(String value) {
    for (OTPTypes type in OTPTypes.values) {
      if (type.toString() == value) return type;
    }
    throw Exception("Can't parse OTPTypes! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case OTPTypes.accountActivation:
        return "account_activation";
      case OTPTypes.passwordRecovery:
        return "password_recovery";
    }
  }
}
