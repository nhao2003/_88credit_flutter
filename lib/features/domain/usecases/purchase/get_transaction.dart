import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/transaction_repository.dart';
import '../../entities/credit/transaction.dart';

class GetTransactionUseCase
    implements UseCase<DataState<TransactionEntity>, String> {
  final TransactionRepository _transtractionRepository;

  GetTransactionUseCase(this._transtractionRepository);

  @override
  Future<DataState<TransactionEntity>> call({String? params}) {
    return _transtractionRepository.getTransactionByAppTransId(params!);
  }
}
