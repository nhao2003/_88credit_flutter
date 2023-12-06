import 'package:get/get.dart';
import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/features/data/data_sources/remote/membership_package_data_source.dart';
import 'package:_88credit_flutter/features/domain/repository/membership_package_repository.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../domain/entities/nhagiare/purchase/membership_package.dart';
import '../models/nhagiare/purchase/order_membership_package_model.dart';

class MembershipPackageRepositoryImpl extends MembershipPackageRepository {
  MembershipPackageRemoteDataSrc remoteDataSrc;

  MembershipPackageRepositoryImpl(this.remoteDataSrc);
  @override
  Future<DataState<List<MembershipPackageEntity>>>
      getMembershipPackages() async {
    try {
      final httpResponse = await remoteDataSrc.getAllMembershipPackages();

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
  Future<DataState<OrderMembershipPackageModel>> createOrder(
      String packageId, int numOfMonth) async {
    try {
      final httpResponse =
          await remoteDataSrc.createOrder(packageId, numOfMonth);
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
      e.printError();
      return DataFailed(e);
    }
  }
}
