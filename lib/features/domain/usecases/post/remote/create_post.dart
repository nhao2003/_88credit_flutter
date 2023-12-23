import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../repository/post_repository.dart';

class CreatePostsUseCase implements UseCase<DataState<void>, PostEntity> {
  final PostRepository _postRepository;

  CreatePostsUseCase(this._postRepository);

  @override
  Future<DataState<void>> call({PostEntity? params}) {
    return _postRepository.createPost(params!);
  }
}
