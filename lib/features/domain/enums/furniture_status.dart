enum FurnitureStatus {
  empty,
  basic,
  full,
  highEnd;

  static FurnitureStatus parse(String value) {
    for (FurnitureStatus status in FurnitureStatus.values) {
      if (status.toString() == value) return status;
    }
    throw Exception(
        "Can't parse FurnitureStatus! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case FurnitureStatus.empty:
        return "empty";
      case FurnitureStatus.basic:
        return "basic";
      case FurnitureStatus.full:
        return "full";
      case FurnitureStatus.highEnd:
        return "high_end";
    }
  }

  static String getStringVi(FurnitureStatus value) {
    switch (value) {
      case FurnitureStatus.empty:
        return "Trống";
      case FurnitureStatus.basic:
        return "Cơ bản";
      case FurnitureStatus.full:
        return "Đầy đủ";
      case FurnitureStatus.highEnd:
        return "Cao cấp";
    }
  }

  static Map<FurnitureStatus, String> toMap() {
    return {
      FurnitureStatus.empty: 'Trống',
      FurnitureStatus.basic: 'Cơ bản',
      FurnitureStatus.full: 'Đầy đủ',
      FurnitureStatus.highEnd: 'Cao cấp',
    };
  }
}
