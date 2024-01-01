import 'package:_88credit_flutter/features/data/models/credit/bank.dart';
import 'package:_88credit_flutter/features/data/models/credit/bank_card.dart';
import 'package:_88credit_flutter/injection_container.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/resources/pair.dart';
import '../local/authentication_local_data_source.dart';

abstract class BankRemoteDataSrc {
  Future<HttpResponse<Pair<int, List<BankModel>>>> getAllBanks(
      String query, int page);
  Future<HttpResponse<List<BankCardModel>>> getBankCards();
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

  @override
  Future<HttpResponse<List<BankCardModel>>> getBankCards() async {
    String url = '$apiUrl$kGetBankCardEndpoint';

    try {
      // get access token
      AuthenLocalDataSrc localDataSrc = sl<AuthenLocalDataSrc>();
      String? accessToken = localDataSrc.getAccessToken();
      if (accessToken == null) {
        throw const ApiException(
            message: 'Access token is null', statusCode: 505);
      }

      final response = await client.get(
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

      List<BankCardModel> bankCards = [];
      if (response.data['result'] != null) {
        bankCards = (response.data['result'] as List<dynamic>? ?? [])
            .map((e) => BankCardModel.fromJson(e))
            .toList();
      }

      return HttpResponse<List<BankCardModel>>(
        bankCards,
        response,
      );
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }
}
