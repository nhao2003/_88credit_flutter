import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/features/domain/usecases/blog/remote/get_all_blogs.dart';
import 'package:_88credit_flutter/injection_container.dart';
import '../../../domain/entities/nhagiare/blog/blog.dart';

class BlogController extends GetxController {
  final GetBlogsUseCase getBlogsUseCase = sl.get<GetBlogsUseCase>();
  Future<List<BlogEntity>> getBlogs() async {
    final result = await getBlogsUseCase.call();
    if (result is DataSuccess) {
      return result.data!;
    } else {
      return [];
    }
  }
}
