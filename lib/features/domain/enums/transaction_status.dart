enum TransactionStatus {
  pending,
  success,
  failed;

  static TransactionStatus fromString(String status) {
    switch (status) {
      case 'pending':
        return TransactionStatus.pending;
      case 'success':
        return TransactionStatus.success;
      case 'failed':
        return TransactionStatus.failed;
      default:
        throw Exception('Invalid transaction status');
    }
  }

  @override
  String toString() {
    switch (this) {
      case TransactionStatus.pending:
        return 'pending';
      case TransactionStatus.success:
        return 'success';
      case TransactionStatus.failed:
        return 'failed';
      default:
        throw Exception('Invalid transaction status');
    }
  }

  String toDisplayString() {
    switch (this) {
      case TransactionStatus.pending:
        return 'Đang chờ';
      case TransactionStatus.success:
        return 'Thành công';
      case TransactionStatus.failed:
        return 'Thất bại';
      default:
        throw Exception('Invalid transaction status');
    }
  }
}
