import 'package:_88credit_flutter/core/constants/constants.dart';
import 'package:_88credit_flutter/features/data/models/credit/loan_request.dart';
import 'package:_88credit_flutter/features/data/models/credit/transaction.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/resources/pair.dart';
import '../../../../core/utils/query_builder.dart';
import '../../../../injection_container.dart';
import '../../../domain/enums/loan_contract_request_status.dart';
import '../db/database_helper.dart';
import '../local/authentication_local_data_source.dart';

abstract class RequestRemoteDataSrc {
  Future<HttpResponse<Pair<int, List<LoanRequestModel>>>> getAllRequests(
      String? userId, int? page);
  Future<HttpResponse<Pair<int, List<LoanRequestModel>>>> getRequestsStatus(
      LoanContractRequestStatus status, int? page);
  Future<HttpResponse<Pair<int, List<LoanRequestModel>>>> getRequestsApproved(
      int? page);

  Future<HttpResponse<void>> createRequest(LoanRequestModel request);
  Future<HttpResponse<void>> confirmRequest(LoanRequestModel request);
  Future<HttpResponse<TransactionModel>> payLoanRequest(String id);
}

class RequestRemoteDataSrcImpl implements RequestRemoteDataSrc {
  final Dio client;

  RequestRemoteDataSrcImpl(this.client);

  @override
  Future<HttpResponse<void>> createRequest(LoanRequestModel request) async {
    const url = '$apiUrl$kCreateRequestEndpoint';
    try {
      // get access token
      AuthenLocalDataSrc localDataSrc = sl<AuthenLocalDataSrc>();
      String? accessToken = localDataSrc.getAccessToken();
      if (accessToken == null) {
        throw const ApiException(
            message: 'Access token is null', statusCode: 505);
      }

      // Gửi yêu cầu đến server
      print(request.toJson());

      final response = await client.post(
        url,
        options: Options(
            sendTimeout: const Duration(seconds: 10),
            headers: {'Authorization': 'Bearer $accessToken'}),
        data: request.toJson(),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.data['message'],
          statusCode: response.statusCode!,
        );
      }

      // Nếu yêu cầu thành công, giải mã dữ liệu JSON
      return HttpResponse(null, response);
    } on DioException catch (e) {
      throw ApiException(
        message: e.message ?? "Error when create post",
        statusCode: e.response?.statusCode ?? 505,
      );
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
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

    String url = '$apiUrl$kGetRequestEndpoint${queryBuilder.build()}';

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

    String url = '$apiUrl$kGetRequestEndpoint${queryBuilder.build()}';

    return await DatabaseHelper().getRequests(url, client);
  }

  @override
  Future<HttpResponse<TransactionModel>> payLoanRequest(String id) {
    var url = '$apiUrl$kPayLoanRequestEndpoint/$id';
    AuthenLocalDataSrc localDataSrc = sl<AuthenLocalDataSrc>();
    String? accessToken = localDataSrc.getAccessToken();
    if (accessToken == null) {
      throw const ApiException(
          message: 'Access token is null', statusCode: 505);
    }
    return client
        .patch(url,
            options: Options(
                sendTimeout: const Duration(seconds: 10),
                headers: {'Authorization': 'Bearer $accessToken'}))
        .then((value) {
      return HttpResponse<TransactionModel>(
          TransactionModel.fromJson(value.data["result"]), value);
    }).catchError((error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    });
  }

  @override
  Future<HttpResponse<void>> confirmRequest(LoanRequestModel request) async {
    String url = '$apiUrl$kConfirmRequestEndpoint/${request.id}';
    print(url);
    try {
      // get access token
      AuthenLocalDataSrc localDataSrc = sl<AuthenLocalDataSrc>();
      String? accessToken = localDataSrc.getAccessToken();
      if (accessToken == null) {
        throw const ApiException(
            message: 'Access token is null', statusCode: 505);
      }

      // Gửi yêu cầu đến server
      print(request.toJson());

      final response = await client.patch(
        url,
        options: Options(
            sendTimeout: const Duration(seconds: 10),
            headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.data['message'],
          statusCode: response.statusCode!,
        );
      }

      // Nếu yêu cầu thành công, giải mã dữ liệu JSON
      return HttpResponse(null, response);
    } on DioException catch (e) {
      throw ApiException(
        message: e.message ?? "Error when create post",
        statusCode: e.response?.statusCode ?? 505,
      );
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }
}
