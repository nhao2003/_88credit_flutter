import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/post_repository.dart';
import '../../../entities/credit/post.dart';

class GetPostsHidedUseCase
    implements UseCase<DataState<List<PostEntity>>, void> {
  final PostRepository _postRepository;

  GetPostsHidedUseCase(this._postRepository);

  @override
  Future<DataState<List<PostEntity>>> call({void params}) {
    return _postRepository.getPostsHided();
  }
}
