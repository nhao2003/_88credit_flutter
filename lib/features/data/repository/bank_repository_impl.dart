import 'dart:io';
import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/features/data/data_sources/remote/bank_remote_data_source.dart';
import 'package:_88credit_flutter/features/data/models/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/repository/bank_repository.dart';
import 'package:dio/dio.dart';
import '../../../core/resources/pair.dart';

class BankRepositoryImpl implements BankRepository {
  final BankRemoteDataSrc _bankRemoteDataSrc;

  BankRepositoryImpl(this._bankRemoteDataSrc);

  @override
  Future<DataState<Pair<int, List<BankEntity>>>> searchBanks(
      String query, int page) async {
    try {
      final httpResponse = await _bankRemoteDataSrc.getAllBanks(query, page);

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
  Future<DataState<List<BankCardEntity>>> getBankCards() async {
    try {
      final httpResponse = await _bankRemoteDataSrc.getBankCards();

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
  Future<DataState<void>> markAsPrimaryBankCard(String id) async {
    try {
      final httpResponse = await _bankRemoteDataSrc.markAsPrimaryBankCard(id);

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
  Future<DataState<void>> addBankCard(BankCardEntity bankCardEntity) async {
    try {
      final httpResponse = await _bankRemoteDataSrc
          .addBankCard(BankCardModel.fromEntity(bankCardEntity));

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
  Future<DataState<void>> deleteBankCard(BankCardEntity bankCardEntity) async {
    try {
      final httpResponse =
          await _bankRemoteDataSrc.deleteBankCard(bankCardEntity.id!);

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
  Future<DataState<BankCardEntity>> getPrimaryBankCard() async {
    try {
      final httpResponse = await _bankRemoteDataSrc.getPrimaryBankCard();

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
}
