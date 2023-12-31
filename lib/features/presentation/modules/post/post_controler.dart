import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_lending.dart';
import 'package:get/get.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/pair.dart';
import '../../../../injection_container.dart';
import '../../../domain/usecases/post/remote/get_posts_borrowing.dart';

class PostController extends GetxController {
  RxList<PostEntity> lendingPosts = <PostEntity>[].obs;
  RxList<PostEntity> borrowingPosts = <PostEntity>[].obs;

  Future<Pair<int, List<PostEntity>>> getPostsLending({int? page}) async {
    final GetPostsLendingUseCase getPostsUseCase = sl<GetPostsLendingUseCase>();
    final dataState = await getPostsUseCase(params: Pair(null, page));

    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      return dataState.data!;
    } else {
      return Pair(1, []);
    }
  }

  Future<Pair<int, List<PostEntity>>> getPostsBorrowing({int? page}) async {
    final GetPostsBorrowingUseCase getPostsUseCase =
        sl<GetPostsBorrowingUseCase>();
    final dataState = await getPostsUseCase(params: Pair(null, page));

    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      return dataState.data!;
    } else {
      return Pair(1, []);
    }
  }

  void navigationToPostDetail(PostEntity post) {
    Get.toNamed(AppRoutes.postDetail, arguments: post);
  }
}
