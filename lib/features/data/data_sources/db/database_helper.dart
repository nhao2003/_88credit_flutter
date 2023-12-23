import 'package:_88credit_flutter/features/data/models/credit/post.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/resources/pair.dart';
import '../../../../core/utils/typedef.dart';

class DatabaseHelper {
  Future<HttpResponse<Pair<int, List<PostModel>>>> getPosts(
      String url, Dio client) async {
    try {
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
        try {
          posts.add(PostModel.fromJson(element));
        } catch (error) {
          error.printInfo();
        }
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
