import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/resources/data_state.dart';
import '../../domain/repository/media_repository.dart';
import '../data_sources/remote/media_remote_date_source.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaRemoteDataSource mediaDataSource;

  MediaRepositoryImpl(this.mediaDataSource);

  @override
  Future<DataState<List<String>>> uploadMedia(List<File> media) async {
    try {
      final response = await mediaDataSource.uploadMedia(media);
      if (response.response.statusCode == HttpStatus.ok) {
        return Future.value(DataSuccess(response.data));
      } else {
        return Future.value(DataFailed(DioException(
          error: response.response.statusMessage,
          response: response.response,
          type: DioExceptionType.badResponse,
          requestOptions: response.response.requestOptions,
        )));
      }
    } catch (e) {
      return Future.value(DataFailed(e as DioException));
    }
  }
}
