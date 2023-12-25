import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/resources/pair.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:_88credit_flutter/features/domain/repository/request_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetBorrowingContractsUseCase
    implements UseCase<DataState<Pair<int, List<ContractEntity>>>, int?> {
  final RequestRepository _requestRepository;

  GetBorrowingContractsUseCase(this._requestRepository);

  @override
  Future<DataState<Pair<int, List<ContractEntity>>>> call({int? params}) {
    return _requestRepository.getBorrowingContract(params);
  }
}
