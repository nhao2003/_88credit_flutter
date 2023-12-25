import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../repository/request_repository.dart';

class CreateRequestsUseCase
    implements UseCase<DataState<void>, LoanRequestEntity> {
  final RequestRepository _requestRepository;

  CreateRequestsUseCase(this._requestRepository);

  @override
  Future<DataState<void>> call({LoanRequestEntity? params}) {
    return _requestRepository.createRequest(params!);
  }
}
