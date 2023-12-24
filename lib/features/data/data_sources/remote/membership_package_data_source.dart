import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';
import 'package:_88credit_flutter/core/constants/constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/typedef.dart';
import '../../models/nhagiare/purchase/membership_package_model.dart';
import '../../models/nhagiare/purchase/order_membership_package_model.dart';

abstract class MembershipPackageRemoteDataSrc {
  Future<HttpResponse<List<MembershipPackageModel>>> getAllMembershipPackages();
  Future<HttpResponse<OrderMembershipPackageModel>> createOrder(
      String id, int numOfMonth);
}

class MembershipPackageRemoteDataSrcImpl
    implements MembershipPackageRemoteDataSrc {
  final Dio client;

  MembershipPackageRemoteDataSrcImpl(this.client);

  @override
  Future<HttpResponse<List<MembershipPackageModel>>>
      getAllMembershipPackages() {
    const url = '$apiUrl$kGetMembershipPackageEndpoint';

    try {
      return client.get(url).then((response) {
        if (response.statusCode != 200) {
          throw ApiException(
            message: response.data,
            statusCode: response.statusCode!,
          );
        }

        final List<DataMap> taskDataList =
            List<DataMap>.from(response.data["result"]);

        List<MembershipPackageModel> value = taskDataList
            .map((postJson) => MembershipPackageModel.fromJson(postJson))
            .toList();

        return HttpResponse(value, response);
      });
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }

  @override
  Future<HttpResponse<OrderMembershipPackageModel>> createOrder(
      String id, int numOfMonth) {
    const url = '$apiUrl$kCreateOrderEndpoint';
    try {
      return client.post(url, data: {
        "membership_package_id": id,
        "num_of_subscription_month": numOfMonth,
        "user_id": "1a9a5785-721a-4bb5-beb7-9d752e2070d4"
      }).then((response) {
        if (response.statusCode != 200) {
          throw ApiException(
            message: response.data,
            statusCode: response.statusCode!,
          );
        }
        final DataMap taskDataList = DataMap.from(response.data["result"]);

        OrderMembershipPackageModel value =
            OrderMembershipPackageModel.fromJson(taskDataList);

        return HttpResponse(value, response);
      });
    } on ApiException {
      rethrow;
    } catch (e) {
      e.printInfo();
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
