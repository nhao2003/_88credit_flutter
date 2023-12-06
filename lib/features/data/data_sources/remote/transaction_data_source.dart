import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:_88credit_flutter/core/constants/constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/typedef.dart';
import '../../models/credit/transaction.dart';

abstract class TransactionRemoteDataSrc {
  // Future<HttpResponse<List<TransactionModel>>> getAllMembershipPackages();
  Future<HttpResponse<TransactionModel>> getTransactionByAppTransId(String id);
}

class TransactionRemoteDataSrcImpl extends TransactionRemoteDataSrc {
  final Dio client;

  TransactionRemoteDataSrcImpl(this.client);

  @override
  Future<HttpResponse<TransactionModel>> getTransactionByAppTransId(String id) {
    String url = '$apiUrl$kGetTransactionEndpoint?id=$id';
    try {
      return client.get(url).then((response) {
        if (response.statusCode != 200) {
          throw ApiException(
            message: response.data,
            statusCode: response.statusCode!,
          );
        }

        final DataMap taskDataList = DataMap.from(response.data["result"]);

        TransactionModel value = TransactionModel.fromJson(taskDataList);

        return HttpResponse(value, response);
      });
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }
}
