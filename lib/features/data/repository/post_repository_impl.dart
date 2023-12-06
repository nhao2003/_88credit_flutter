import 'dart:io';
import 'package:dio/dio.dart';
import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/features/data/data_sources/remote/post_remote_data_sources.dart';
import 'package:_88credit_flutter/features/domain/repository/post_repository.dart';
import '../../domain/entities/credit/post.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSrc _dataSrc;
  PostRepositoryImpl(this._dataSrc);

  @override
  Future<DataState<List<PostEntity>>> getPosts(String? userId) async {
    try {
      final httpResponse = await _dataSrc.getAllPosts(userId);

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
  Future<DataState<void>> createPost(PostEntity post) async {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> deletePost(String id) async {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<DataState<PostEntity>> getSinglePost(String id) async {
    // TODO: implement getSinglePost
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> updatePost(PostEntity post) async {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<PostEntity>>> getPostsApproved() async {
    try {
      final httpResponse = await _dataSrc.getPostsApproved();

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
  Future<DataState<List<PostEntity>>> getPostsHided() async {
    try {
      final httpResponse = await _dataSrc.getPostsHided();

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
  Future<DataState<List<PostEntity>>> getPostsPending() async {
    try {
      final httpResponse = await _dataSrc.getPostsPending();

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
  Future<DataState<List<PostEntity>>> getPostsRejected() async {
    try {
      final httpResponse = await _dataSrc.getPostsRejected();

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
