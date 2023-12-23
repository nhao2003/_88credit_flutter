import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/post_repository.dart';
import '../../../../../core/resources/pair.dart';
import '../../../entities/credit/post.dart';

class GetPostsRejectUseCase
    implements UseCase<DataState<Pair<int, List<PostEntity>>>, int?> {
  final PostRepository _postRepository;

  GetPostsRejectUseCase(this._postRepository);

  @override
  Future<DataState<Pair<int, List<PostEntity>>>> call({int? params}) {
    return _postRepository.getPostsRejected(params);
  }
}
