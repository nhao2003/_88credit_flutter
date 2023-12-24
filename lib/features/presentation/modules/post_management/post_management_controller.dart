import 'package:get/get.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_approved.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_hided.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_pending.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_rejected.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/pair.dart';
import '../../../../injection_container.dart';
import '../../../domain/entities/credit/post.dart';

class PostManagementController extends GetxController {
  RxList<PostEntity> pendingPosts = <PostEntity>[].obs;
  RxList<PostEntity> approvedPosts = <PostEntity>[].obs;
  RxList<PostEntity> rejectedPosts = <PostEntity>[].obs;
  RxList<PostEntity> hidedPosts = <PostEntity>[].obs;

  List<String> typePosts = [
    "Đã đăng",
    "Chờ duyệt",
    "Bị từ chối",
    "Đã ẩn",
  ];

  // get all posts
  final GetPostsApprovedUseCase _getPostsApprovedUseCase =
      sl<GetPostsApprovedUseCase>();
  final GetPostsPendingUseCase _getPostsPendingUseCase =
      sl<GetPostsPendingUseCase>();
  final GetPostsRejectUseCase _getPostsRejectUseCase =
      sl<GetPostsRejectUseCase>();
  final GetPostsHidedUseCase _getPostsHidedUseCase = sl<GetPostsHidedUseCase>();

  Future<Pair<int, List<PostEntity>>> getPostsApproved({int? page = 1}) async {
    final dataState = await _getPostsApprovedUseCase(params: page);
    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      return dataState.data!;
    } else {
      return Pair(1, []);
    }
  }

  Future<Pair<int, List<PostEntity>>> getPostsPending({int? page = 1}) async {
    final dataState = await _getPostsPendingUseCase(params: page);
    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      return dataState.data!;
    } else {
      return Pair(1, []);
    }
  }

  Future<Pair<int, List<PostEntity>>> getPostsRejected({int? page = 1}) async {
    final dataState = await _getPostsRejectUseCase(params: page);
    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      return dataState.data!;
    } else {
      return Pair(1, []);
    }
  }

  Future<Pair<int, List<PostEntity>>> getPostsHided({int? page = 1}) async {
    final dataState = await _getPostsHidedUseCase(params: page);
    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      return dataState.data!;
    } else {
      return Pair(1, []);
    }
  }

  Future<void> getPostsInit() async {
    getPostsApproved();
    getPostsPending();
    getPostsRejected();
    getPostsHided();
  }

  void navigationToPostDetail(PostEntity post) {
    Get.toNamed(AppRoutes.postDetail, arguments: post);
  }

  void showPost(PostEntity post) async {
    //await repository.hideOrUnHidePost(post.id, false);
    await getPostsInit();
  }

  void hidePost(PostEntity post) async {
    //await repository.hideOrUnHidePost(post.id, true);
    await getPostsInit();
  }

  void editPost(PostEntity post) async {
    // TODO: implement editPost
    // edit post

    // Get.toNamed(AppRoutes.post, parameters: {
    //   "id": post.id,
    //   'type': post.type.toString(),
    // });
  }

  void deletePost(PostEntity post) async {
    //await repository.deletePost(post.id);
    await getPostsInit();
  }

  void extensionPost(PostEntity post) async {
    //await repository.extendPostExpiryDate(post.id, true);
    await getPostsInit();
  }
}
