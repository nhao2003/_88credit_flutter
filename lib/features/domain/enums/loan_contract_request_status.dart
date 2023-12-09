enum LoanContractRequestStatus {
  cancle,
  pending,
  rejected,
  waitingForPayment,
  paid;

  static LoanContractRequestStatus parse(String value) {
    for (LoanContractRequestStatus status in LoanContractRequestStatus.values) {
      if (status.toString() == value) return status;
    }
    throw Exception(
        "Can't parse LoanContractRequestStatus! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case LoanContractRequestStatus.cancle:
        return "cancle";
      case LoanContractRequestStatus.pending:
        return "pending";
      case LoanContractRequestStatus.rejected:
        return "rejected";
      case LoanContractRequestStatus.waitingForPayment:
        return "waiting_for_payment";
      case LoanContractRequestStatus.paid:
        return "paid";
    }
  }

  String getStringVi() {
    switch (this) {
      case LoanContractRequestStatus.cancle:
        return "Đã xác nhận";
      case LoanContractRequestStatus.pending:
        return "Đang chờ";
      case LoanContractRequestStatus.rejected:
        return "Đã từ chối";
      case LoanContractRequestStatus.waitingForPayment:
        return "Đang chờ thanh toán";
      case LoanContractRequestStatus.paid:
        return "Đã thanh toán";
    }
  }

  // toMap
  static Map<LoanContractRequestStatus, String> toMap() {
    return {
      LoanContractRequestStatus.cancle: "Đã hủy",
      LoanContractRequestStatus.pending: "Đang chờ",
      LoanContractRequestStatus.rejected: "Đã từ chối",
      LoanContractRequestStatus.waitingForPayment: "Đang chờ thanh toán",
      LoanContractRequestStatus.paid: "Đã thanh toán",
    };
  }
}
