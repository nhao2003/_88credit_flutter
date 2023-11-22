enum PropertyTypes {
  apartment,
  land,
  office,
  motel,
  house;

  static PropertyTypes parse(String value) {
    for (PropertyTypes type in PropertyTypes.values) {
      if (type.toString() == value) return type;
    }
    throw Exception(
        "Can't parse PropertyTypes! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case PropertyTypes.apartment:
        return "apartment";
      case PropertyTypes.land:
        return "land";
      case PropertyTypes.office:
        return "office";
      case PropertyTypes.motel:
        return "motel";
      case PropertyTypes.house:
        return "house";
    }
  }

  String getStringVi() {
    switch (this) {
      case PropertyTypes.office:
        return "Văn phòng, Mặt bằng kinh doanh";
      case PropertyTypes.land:
        return "Đất";
      case PropertyTypes.house:
        return "Nhà ở";
      case PropertyTypes.motel:
        return "Phòng trọ";
      case PropertyTypes.apartment:
        return "Căn hộ/Chung cư";
    }
  }

  static Map<PropertyTypes, String> toMap() {
    return {
      PropertyTypes.office: 'Văn phòng, Mặt bằng kinh doanh',
      PropertyTypes.land: 'Đất',
      PropertyTypes.house: 'Nhà ở',
      PropertyTypes.motel: 'Phòng trọ',
      PropertyTypes.apartment: 'Căn hộ/Chung cư',
    };
  }
}
