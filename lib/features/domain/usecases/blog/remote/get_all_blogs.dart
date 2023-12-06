import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/blog_repository.dart';
import '../../../entities/nhagiare/blog/blog.dart';

class GetBlogsUseCase implements UseCase<DataState<List<BlogEntity>>, void> {
  final BlogRepository _blogRepository;

  GetBlogsUseCase(this._blogRepository);

  @override
  Future<DataState<List<BlogEntity>>> call({void params}) {
    return _blogRepository.getAllBlogs();
  }
}
