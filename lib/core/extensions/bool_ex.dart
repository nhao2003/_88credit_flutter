extension BoolX on bool {
  String getStringVi() {
    if (this) {
      return "Có";
    }
    return "Không";
  }
}
