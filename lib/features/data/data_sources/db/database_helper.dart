import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/typedef.dart';
import '../../../domain/entities/credit/post.dart';

class DatabaseHelper {
  Future<HttpResponse<List<PostEntity>>> getPosts(
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

      final List<DataMap> taskDataList =
          List<DataMap>.from(response.data["result"]["data"]);

      List<PostEntity> value = taskDataList
          .map((postJson) => PostEntity.fromJson(postJson))
          .toList();

      return HttpResponse(value, response);
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }
}
