import 'package:_88credit_flutter/features/data/models/credit/bank.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/resources/pair.dart';

abstract class BankRemoteDataSrc {
  Future<HttpResponse<Pair<int, List<BankModel>>>> getAllBanks(
      String query, int page);
}

class BankRemoteDataSrcImpl extends BankRemoteDataSrc {
  final Dio client;

  BankRemoteDataSrcImpl(this.client);

  @override
  Future<HttpResponse<Pair<int, List<BankModel>>>> getAllBanks(
      String query, int page) {
    String url = '$apiUrl$kGetBankEndpoint';

    if (query.trim().isNotEmpty) {
      url += '?search=$query';
    }

    try {
      return client.get(url).then((response) {
        List<BankModel> banks = [];
        if (response.data['result'] != null) {
          banks = (response.data['result'] as List<dynamic>? ?? [])
              .map((e) => BankModel.fromJson(e))
              .toList();
        }

        return HttpResponse<Pair<int, List<BankModel>>>(
          Pair(1, banks),
          response,
        );
      });
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }
}
