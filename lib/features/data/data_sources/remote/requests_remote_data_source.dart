import 'package:_88credit_flutter/core/constants/constants.dart';
import 'package:_88credit_flutter/features/data/models/credit/loan_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import '../../../../core/resources/pair.dart';
import '../../../../core/utils/query_builder.dart';
import '../../../domain/enums/loan_contract_request_status.dart';
import '../db/database_helper.dart';

abstract class RequestRemoteDataSrc {
  Future<HttpResponse<Pair<int, List<LoanRequestModel>>>> getAllRequests(
      String? userId, int? page);
  Future<HttpResponse<Pair<int, List<LoanRequestModel>>>> getRequestsStatus(
      LoanContractRequestStatus status, int? page);
  Future<HttpResponse<Pair<int, List<LoanRequestModel>>>> getRequestsApproved(
      int? page);

  Future<HttpResponse<void>> createRequest(LoanRequestModel request);
}

class RequestRemoteDataSrcImpl implements RequestRemoteDataSrc {
  final Dio client;

  RequestRemoteDataSrcImpl(this.client);

  @override
  Future<HttpResponse<void>> createRequest(LoanRequestModel request) async {
    // TODO: implement createRequest
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<Pair<int, List<LoanRequestModel>>>> getAllRequests(
      String? userId, int? page) async {
    var url = '$apiUrl$kGetRequestEndpoint';

    QueryBuilder queryBuilder = QueryBuilder();
    int pageQuery = page ?? 1;
    queryBuilder.addPage(pageQuery);

    if (userId != null) {
      queryBuilder.addQuery(
          'request_receiver_id', Operation.equals, '\'$userId\'');
    }

    queryBuilder.addOrderBy('created_at', OrderBy.desc);

    url += queryBuilder.build();
    return await DatabaseHelper().getRequests(url, client);
  }

  @override
  Future<HttpResponse<Pair<int, List<LoanRequestModel>>>> getRequestsApproved(
      int? page) async {
    int pageQuery = page ?? 1;
    QueryBuilder queryBuilder = QueryBuilder();
    queryBuilder.addPage(pageQuery);
    queryBuilder.addQuery('request_status', Operation.inValue,
        '\'${LoanContractRequestStatus.paid.toString()}\',\'${LoanContractRequestStatus.waitingForPayment.toString()}\'');
    queryBuilder.addOrderBy('created_at', OrderBy.desc);

    String url = '$apiUrl$kGetPostEndpoint${queryBuilder.build()}';

    return await DatabaseHelper().getRequests(url, client);
  }

  @override
  Future<HttpResponse<Pair<int, List<LoanRequestModel>>>> getRequestsStatus(
      LoanContractRequestStatus status, int? page) async {
    int pageQuery = page ?? 1;
    QueryBuilder queryBuilder = QueryBuilder();
    queryBuilder.addPage(pageQuery);
    queryBuilder.addQuery(
        'request_status', Operation.equals, '\'${status.toString()}\'');
    queryBuilder.addOrderBy('created_at', OrderBy.desc);

    String url = '$apiUrl$kGetPostEndpoint${queryBuilder.build()}';

    return await DatabaseHelper().getRequests(url, client);
  }
}
