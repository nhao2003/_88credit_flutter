import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/post_repository.dart';
import '../../../entities/posts/real_estate_post.dart';

class GetPostsPendingUseCase
    implements UseCase<DataState<List<RealEstatePostEntity>>, void> {
  final PostRepository _postRepository;

  GetPostsPendingUseCase(this._postRepository);

  @override
  Future<DataState<List<RealEstatePostEntity>>> call({void params}) {
    return _postRepository.getPostsPending();
  }
}
