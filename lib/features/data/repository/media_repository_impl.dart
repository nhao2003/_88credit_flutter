import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/resources/data_state.dart';
import '../../domain/repository/media_repository.dart';
import '../data_sources/remote/media_remote_date_source.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaRemoteDataSource mediaDataSource;

  MediaRepositoryImpl(this.mediaDataSource);

  @override
  Future<DataState<List<String>>> uploadMedia(List<File> media, String typeMedia) async {
    try {
      final response = await mediaDataSource.uploadMedia(media, typeMedia);
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(DioException(
          error: response.response.statusMessage,
          response: response.response,
          type: DioExceptionType.badResponse,
          requestOptions: response.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
