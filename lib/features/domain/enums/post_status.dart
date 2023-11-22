enum PostStatus {
  pending,
  approved,
  rejected,
  hided;

  static PostStatus parse(String value) {
    for (PostStatus status in PostStatus.values) {
      if (status.toString() == value) return status;
    }
    throw Exception("Can't parse PostStatus! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case PostStatus.pending:
        return "pending";
      case PostStatus.approved:
        return "approved";
      case PostStatus.rejected:
        return "rejected";
      case PostStatus.hided:
        return "hided";
    }
  }
}
