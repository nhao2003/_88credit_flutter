enum ApartmentTypes {
  apartment,
  duplex,
  officetel,
  service,
  dormitory,
  penhouse;

  static ApartmentTypes parse(String value) {
    for (ApartmentTypes type in ApartmentTypes.values) {
      if (type.toString() == value) return type;
    }
    throw Exception(
        "Can't parse ApartmentTypes! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case ApartmentTypes.apartment:
        return "apartment";
      case ApartmentTypes.duplex:
        return "duplex";
      case ApartmentTypes.officetel:
        return "officetel";
      case ApartmentTypes.service:
        return "service";
      case ApartmentTypes.dormitory:
        return "dormitory";
      case ApartmentTypes.penhouse:
        return "penhouse";
    }
  }

  static String getStringVi(ApartmentTypes type) {
    switch (type) {
      case ApartmentTypes.apartment:
        return "Căn hộ";
      case ApartmentTypes.duplex:
        return "Duplex";
      case ApartmentTypes.officetel:
        return "Officetel";
      case ApartmentTypes.service:
        return "Dịch vụ";
      case ApartmentTypes.dormitory:
        return "Ký túc xá";
      case ApartmentTypes.penhouse:
        return "Penthouse";
    }
  }

  // tomap
  static Map<ApartmentTypes, String> toMap() {
    return {
      ApartmentTypes.apartment: "Căn hộ",
      ApartmentTypes.duplex: "Duplex",
      ApartmentTypes.officetel: "Officetel",
      ApartmentTypes.service: "Dịch vụ",
      ApartmentTypes.dormitory: "Ký túc xá",
      ApartmentTypes.penhouse: "Penthouse",
    };
  }
}
