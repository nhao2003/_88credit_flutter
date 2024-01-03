import 'package:_88credit_flutter/features/data/models/credit/contract.dart';
import 'package:_88credit_flutter/features/data/models/credit/loan_request.dart';
import 'package:_88credit_flutter/features/data/models/credit/post.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/resources/pair.dart';
import '../../../../core/utils/typedef.dart';
import '../../../../injection_container.dart';
import '../local/authentication_local_data_source.dart';

class DatabaseHelper {
  Future<HttpResponse<Pair<int, List<PostModel>>>> getPosts(
      String url, Dio client) async {
    try {
      print(url);
      final response = await client.get(url);
      //print('${response.statusCode} : ${response.data["message"].toString()}');
      if (response.statusCode != 200) {
        //print('${response.statusCode} : ${response.data["result"].toString()}');
        throw ApiException(
          message: response.data,
          statusCode: response.statusCode!,
        );
      }

      final int numOfPages = response.data["num_of_pages"];

      final List<DataMap> taskDataList =
          List<DataMap>.from(response.data["result"]);

      List<PostModel> posts = [];
      for (var element in taskDataList) {
        posts.add(PostModel.fromJson(element));
      }

      final value = Pair(numOfPages, posts);

      return HttpResponse(value, response);
    } on ApiException {
      rethrow;
    } catch (error) {
      error.printError();
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }

  Future<HttpResponse<Pair<int, List<LoanRequestModel>>>> getRequests(
      String url, Dio client) async {
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
      print(url);
      //print('${response.statusCode} : ${response.data["message"].toString()}');
      if (response.statusCode != 200) {
        //print('${response.statusCode} : ${response.data["result"].toString()}');
        throw ApiException(
          message: response.data,
          statusCode: response.statusCode!,
        );
      }

      final int numOfPages = response.data["num_of_pages"];

      final List<DataMap> taskDataList =
          List<DataMap>.from(response.data["result"]);

      List<LoanRequestModel> posts = [];
      for (var element in taskDataList) {
        posts.add(LoanRequestModel.fromJson(element));
      }

      final value = Pair(numOfPages, posts);

      return HttpResponse(value, response);
    } on ApiException {
      rethrow;
    } catch (error) {
      error.printError();
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }

  Future<HttpResponse<Pair<int, List<ContractModel>>>> getContracts(
      String url, Dio client) async {
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
      print(url);
      //print('${response.statusCode} : ${response.data["message"].toString()}');
      if (response.statusCode != 200) {
        //print('${response.statusCode} : ${response.data["result"].toString()}');
        throw ApiException(
          message: response.data,
          statusCode: response.statusCode!,
        );
      }

      final int numOfPages = response.data["num_of_pages"];

      final List<DataMap> taskDataList =
          List<DataMap>.from(response.data["result"]);

      List<ContractModel> posts = [];
      for (var element in taskDataList) {
        posts.add(ContractModel.fromJson(element));
      }

      final value = Pair(numOfPages, posts);

      return HttpResponse(value, response);
    } on ApiException {
      rethrow;
    } catch (error) {
      error.printError();
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }
}
