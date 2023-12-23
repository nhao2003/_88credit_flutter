import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/enums/post_type.dart';
import 'package:_88credit_flutter/features/domain/repository/post_repository.dart';
import '../../../../../core/resources/pair.dart';
import '../../../entities/credit/post.dart';

class GetPostsBorrowingUseCase
    implements
        UseCase<DataState<Pair<int, List<PostEntity>>>, Pair<String?, int?>?> {
  final PostRepository _postRepository;

  GetPostsBorrowingUseCase(this._postRepository);

  @override
  Future<DataState<Pair<int, List<PostEntity>>>> call(
      {Pair<String?, int?>? params}) {
    if (params == null) {
      return _postRepository.getPosts(null, PostTypes.borrowing, null);
    }
    return _postRepository.getPosts(
        params.first, PostTypes.borrowing, params.second);
  }
}
