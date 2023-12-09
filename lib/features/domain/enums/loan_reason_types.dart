enum LoanReasonTypes {
  business,
  education,
  travel,
  wedding,
  medical,
  shopping,
  other;

  //parse
  static LoanReasonTypes parse(String value) {
    for (LoanReasonTypes type in LoanReasonTypes.values) {
      if (type.toString() == value) return type;
    }
    throw Exception(
        "Can't parse LoanReasonTypes! Your input value is \"$value\"");
  }

  //toString
  @override
  String toString() {
    switch (this) {
      case LoanReasonTypes.business:
        return "business";
      case LoanReasonTypes.education:
        return "education";
      case LoanReasonTypes.travel:
        return "travel";
      case LoanReasonTypes.wedding:
        return "wedding";
      case LoanReasonTypes.medical:
        return "medical";
      case LoanReasonTypes.shopping:
        return "shopping";
      case LoanReasonTypes.other:
        return "other";
    }
  }

  //getStringVi
  String toStringVi() {
    switch (this) {
      case LoanReasonTypes.business:
        return "Kinh doanh";
      case LoanReasonTypes.education:
        return "Học tập";
      case LoanReasonTypes.travel:
        return "Du lịch";
      case LoanReasonTypes.wedding:
        return "Cưới hỏi";
      case LoanReasonTypes.medical:
        return "Y tế";
      case LoanReasonTypes.shopping:
        return "Mua sắm";
      case LoanReasonTypes.other:
        return "Khác";
    }
  }

  //toMap
  static Map<LoanReasonTypes, String> toMap() {
    return {
      LoanReasonTypes.business: "Kinh doanh",
      LoanReasonTypes.education: "Học tập",
      LoanReasonTypes.travel: "Du lịch",
      LoanReasonTypes.wedding: "Cưới hỏi",
      LoanReasonTypes.medical: "Y tế",
      LoanReasonTypes.shopping: "Mua sắm",
      LoanReasonTypes.other: "Khác",
    };
  }
}
