import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/features/domain/entities/purchase/transaction.dart';

abstract class TransactionRepository {
  // Future<DataState<List<TransactionEntity>>> getTransactions();

  Future<DataState<TransactionEntity>> getTransactionByAppTransId(String id);
}
