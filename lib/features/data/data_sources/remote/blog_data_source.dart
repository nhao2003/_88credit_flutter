import 'package:_88credit_flutter/features/data/models/blog/blog_model.dart';
import 'package:retrofit/dio.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:_88credit_flutter/core/constants/constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/typedef.dart';

abstract class BlogRemoteDataSrc {
  Future<HttpResponse<List<BlogModel>>> getAllBlogs();
}

class BlogRemoteDataSrcImpl implements BlogRemoteDataSrc {
  final Dio client;

  BlogRemoteDataSrcImpl(this.client);

  @override
  Future<HttpResponse<List<BlogModel>>> getAllBlogs() async {
    const url = '$apiUrl$kGetBlogEndpoint';

    try {
      final response = await client.get(url);

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.data,
          statusCode: response.statusCode!,
        );
      }

      final List<DataMap> taskDataList =
          List<DataMap>.from(response.data["result"]);

      List<BlogModel> value =
          taskDataList.map((postJson) => BlogModel.fromJson(postJson)).toList();

      return HttpResponse(value, response);
    } on ApiException {
      rethrow;
    } catch (error) {
      throw ApiException(message: error.toString(), statusCode: 505);
    }
  }
}
