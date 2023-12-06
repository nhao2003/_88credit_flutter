import 'package:_88credit_flutter/core/resources/data_state.dart';
import '../entities/nhagiare/blog/blog.dart';

abstract class BlogRepository {
  Future<DataState<List<BlogEntity>>> getAllBlogs();
}
