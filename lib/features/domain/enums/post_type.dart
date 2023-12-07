enum PostTypes {
  lending,
  borrowing;

  //parse string to enum
  static PostTypes parse(String value) {
    for (PostTypes type in PostTypes.values) {
      if (type.toString() == value) return type;
    }
    throw Exception("Can't parse PostTypes! Your input value is \"$value\"");
  }

  static PostTypes parseVi(String value) {
    for (PostTypes type in PostTypes.values) {
      if (type.getStringVi() == value) return type;
    }
    throw Exception("Can't parse PostTypes! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case PostTypes.lending:
        return "lending";
      case PostTypes.borrowing:
        return "borrowing";
    }
  }

  // to string vi getStringVi
  String getStringVi() {
    switch (this) {
      case PostTypes.lending:
        return "Cho vay";
      case PostTypes.borrowing:
        return "Cần vay";
    }
  }
}
