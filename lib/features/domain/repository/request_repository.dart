import 'package:_88credit_flutter/core/resources/pair.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import '../../../../core/resources/data_state.dart';

abstract class RequestRepository {
  // API remote
  Future<DataState<Pair<int, List<LoanRequestEntity>>>> getRequests(
      String? idUser, int? page);
  Future<DataState<LoanRequestEntity>> getSingleRequest(String id);
  Future<DataState<void>> createRequest(LoanRequestEntity request);
  // management
  Future<DataState<Pair<int, List<LoanRequestEntity>>>> getRequestsApproved(
      int? page);
  Future<DataState<Pair<int, List<LoanRequestEntity>>>> getRequestsPending(
      int? page);
  Future<DataState<Pair<int, List<LoanRequestEntity>>>> getRequestsRejected(
      int? page);
}
