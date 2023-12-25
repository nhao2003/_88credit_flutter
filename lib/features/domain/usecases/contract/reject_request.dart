import 'package:_88credit_flutter/core/resources/pair.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../repository/request_repository.dart';

class RejectRequestUseCase
    implements UseCase<DataState<void>, Pair<LoanRequestEntity, String>> {
  final RequestRepository _requestRepository;

  RejectRequestUseCase(this._requestRepository);

  @override
  Future<DataState<void>> call({Pair<LoanRequestEntity, String>? params}) {
    return _requestRepository.rejectRequest(params!.first, params.second);
  }
}
