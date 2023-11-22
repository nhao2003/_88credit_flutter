import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/features/domain/entities/blog/blog.dart';

abstract class BlogRepository {
  Future<DataState<List<BlogEntity>>> getAllBlogs();
}
