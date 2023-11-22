import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/post_repository.dart';
import '../../../entities/posts/real_estate_post.dart';

class GetPostsUseCase
    implements UseCase<DataState<List<RealEstatePostEntity>>, String?> {
  final PostRepository _postRepository;

  GetPostsUseCase(this._postRepository);

  @override
  Future<DataState<List<RealEstatePostEntity>>> call({String? params}) {
    return _postRepository.getPosts(params);
  }
}
