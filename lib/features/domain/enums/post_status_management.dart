enum PostStatusManagement {
  pending,
  approved,
  rejected,
  exprired,
  hided;

  static PostStatusManagement parse(String value) {
    for (PostStatusManagement status in PostStatusManagement.values) {
      if (status.toString() == value) return status;
    }
    throw Exception("Can't parse PostStatus! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case PostStatusManagement.pending:
        return "pending";
      case PostStatusManagement.approved:
        return "approved";
      case PostStatusManagement.rejected:
        return "rejected";
      case PostStatusManagement.hided:
        return "hided";
      case PostStatusManagement.exprired:
        return "exprired";
    }
  }
}
