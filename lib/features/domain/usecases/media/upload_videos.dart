import 'dart:io';
import 'package:_88credit_flutter/features/domain/repository/media_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';

class UploadVideosUseCase
    implements UseCase<DataState<List<String>>, List<File>> {
  final MediaRepository _postRepository;

  UploadVideosUseCase(this._postRepository);

  @override
  Future<DataState<List<String>>> call({List<File>? params}) {
    return _postRepository.uploadMedia(params!, 'video');
  }
}
