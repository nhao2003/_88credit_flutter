enum OfficeTypes {
  office,
  officetel,
  shophouse,
  comercialspace;

  static OfficeTypes parse(String value) {
    for (OfficeTypes type in OfficeTypes.values) {
      if (type.toString() == value) return type;
    }
    throw Exception("Can't parse OfficeTypes! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case OfficeTypes.office:
        return "office";
      case OfficeTypes.officetel:
        return "officetel";
      case OfficeTypes.shophouse:
        return "shophouse";
      case OfficeTypes.comercialspace:
        return "comercialspace";
    }
  }

  static String getStringVi(OfficeTypes type) {
    switch (type) {
      case OfficeTypes.office:
        return "Văn phòng";
      case OfficeTypes.officetel:
        return "officetel";
      case OfficeTypes.shophouse:
        return "Nhà phố thương mại";
      case OfficeTypes.comercialspace:
        return "Không gian thương mại";
    }
  }

  static Map<OfficeTypes, String> toMap() {
    return {
      OfficeTypes.office: getStringVi(OfficeTypes.office),
      OfficeTypes.officetel: getStringVi(OfficeTypes.officetel),
      OfficeTypes.shophouse: getStringVi(OfficeTypes.shophouse),
      OfficeTypes.comercialspace: getStringVi(OfficeTypes.comercialspace),
    };
  }
}
