import 'dart:io';

import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/resources/pair.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_contract_request_status.dart';
import 'package:dio/dio.dart';
import '../../domain/repository/request_repository.dart';
import '../data_sources/remote/requests_remote_data_source.dart';

class RequestRepositoryImpl implements RequestRepository {
  final RequestRemoteDataSrc _dataSrc;
  RequestRepositoryImpl(this._dataSrc);

  @override
  Future<DataState<void>> createRequest(LoanRequestEntity request) {
    // TODO: implement createRequest
    throw UnimplementedError();
  }

  @override
  Future<DataState<Pair<int, List<LoanRequestEntity>>>> getRequests(
      String? idUser, int? page) async {
    try {
      final httpResponse = await _dataSrc.getAllRequests(idUser, page);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Pair<int, List<LoanRequestEntity>>>> getRequestsApproved(
      int? page) async {
    try {
      final httpResponse = await _dataSrc.getRequestsApproved(page);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Pair<int, List<LoanRequestEntity>>>> getRequestsPending(
      int? page) async {
    try {
      final httpResponse = await _dataSrc.getRequestsStatus(
          LoanContractRequestStatus.pending, page);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Pair<int, List<LoanRequestEntity>>>> getRequestsRejected(
      int? page) async {
    try {
      final httpResponse = await _dataSrc.getRequestsStatus(
          LoanContractRequestStatus.rejected, page);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<LoanRequestEntity>> getSingleRequest(String id) {
    // TODO: implement getSingleRequest
    throw UnimplementedError();
  }
}