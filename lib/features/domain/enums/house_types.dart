enum HouseTypes {
  townhouse,
  villa,
  alleyhouse,
  frontagehouse;

  static HouseTypes parse(String value) {
    for (HouseTypes type in HouseTypes.values) {
      if (type.toString() == value) return type;
    }
    throw Exception("Can't parse HouseTypes! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case HouseTypes.townhouse:
        return "townhouse";
      case HouseTypes.villa:
        return "villa";
      case HouseTypes.alleyhouse:
        return "alleyhouse";
      case HouseTypes.frontagehouse:
        return "frontagehouse";
    }
  }

  static String getStringVi(HouseTypes type) {
    switch (type) {
      case HouseTypes.townhouse:
        return "Nhà phố";
      case HouseTypes.villa:
        return "Biệt thự";
      case HouseTypes.alleyhouse:
        return "Nhà hẻm";
      case HouseTypes.frontagehouse:
        return "Nhà mặt tiền";
    }
  }

  // tomap
  static Map<HouseTypes, String> toMap() {
    return {
      HouseTypes.townhouse: "Nhà phố",
      HouseTypes.villa: "Biệt thự",
      HouseTypes.alleyhouse: "Nhà hẻm",
      HouseTypes.frontagehouse: "Nhà mặt tiền",
    };
  }
}
