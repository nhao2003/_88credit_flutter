enum UserStatus {
  unverified,
  notUpdate,
  banned,
  deleted,
  verified;

  static UserStatus parse(String value) {
    for (UserStatus type in UserStatus.values) {
      if (type.toString() == value) return type;
    }
    throw Exception("Can't parse UserStatus! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case UserStatus.unverified:
        return "unverified";
      case UserStatus.notUpdate:
        return "not_update";
      case UserStatus.banned:
        return "banned";
      case UserStatus.deleted:
        return "deleted";
      case UserStatus.verified:
        return "verified";
    }
  }

  String get value {
    switch (this) {
      case UserStatus.unverified:
        return "unverified";
      case UserStatus.notUpdate:
        return "not_update";
      case UserStatus.banned:
        return "banned";
      case UserStatus.deleted:
        return "deleted";
      case UserStatus.verified:
        return "verified";
    }
  }
}
