enum Role {
  admin,
  staff,
  user;

  static Role parse(String value) {
    for (Role role in Role.values) {
      if (role.toString() == value) return role;
    }
    throw Exception("Can't parse Role! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case Role.admin:
        return "admin";
      case Role.staff:
        return "staff";
      case Role.user:
        return "user";
    }
  }
}
