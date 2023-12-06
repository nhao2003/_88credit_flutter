import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/post_repository.dart';
import '../../../entities/credit/post.dart';

class GetPostsUseCase implements UseCase<DataState<List<PostEntity>>, String?> {
  final PostRepository _postRepository;

  GetPostsUseCase(this._postRepository);

  @override
  Future<DataState<List<PostEntity>>> call({String? params}) {
    return _postRepository.getPosts(params);
  }
}
