enum LegalDocumentStatus {
  waitingForCertificates,
  haveCertificates,
  otherDocuments;

  static LegalDocumentStatus parse(String value) {
    for (LegalDocumentStatus status in LegalDocumentStatus.values) {
      if (status.toString() == value) return status;
    }
    throw Exception(
        "Can't parse LegalDocumentStatus! Your input value is \"$value\"");
  }

  @override
  String toString() {
    switch (this) {
      case LegalDocumentStatus.waitingForCertificates:
        return "waiting_for_certificates";
      case LegalDocumentStatus.haveCertificates:
        return "have_certificates";
      case LegalDocumentStatus.otherDocuments:
        return "other_documents";
    }
  }

  static String getStringVi(LegalDocumentStatus value) {
    switch (value) {
      case LegalDocumentStatus.waitingForCertificates:
        return "Đang chờ giấy tờ";
      case LegalDocumentStatus.haveCertificates:
        return "Đã có giấy tờ";
      case LegalDocumentStatus.otherDocuments:
        return "Các giấy tờ khác";
    }
  }

  // toMap
  static Map<LegalDocumentStatus, String> toMap() {
    return {
      LegalDocumentStatus.waitingForCertificates: "Đang chờ giấy tờ",
      LegalDocumentStatus.haveCertificates: "Đã có giấy tờ",
      LegalDocumentStatus.otherDocuments: "Các giấy tờ khác",
    };
  }
}
