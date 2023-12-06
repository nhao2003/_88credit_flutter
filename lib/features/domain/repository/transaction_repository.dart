import 'package:_88credit_flutter/core/resources/data_state.dart';
import '../entities/credit/transaction.dart';

abstract class TransactionRepository {
  // Future<DataState<List<TransactionEntity>>> getTransactions();

  Future<DataState<TransactionEntity>> getTransactionByAppTransId(String id);
}
