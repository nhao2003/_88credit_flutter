import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/resources/pair.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import 'package:_88credit_flutter/features/domain/repository/request_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetRequestWaitingPaymentUseCase
    implements UseCase<DataState<Pair<int, List<LoanRequestEntity>>>, int?> {
  final RequestRepository _requestRepository;

  GetRequestWaitingPaymentUseCase(this._requestRepository);

  @override
  Future<DataState<Pair<int, List<LoanRequestEntity>>>> call({int? params}) {
    return _requestRepository.getRequestsWaitingPayment(params);
  }
}
