import 'package:get/get.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_approved.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_hided.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_pending.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_rejected.dart';
import '../../../../core/resources/data_state.dart';
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

  Future<List<PostEntity>> getPostsApproved() async {
    final dataState = await _getPostsApprovedUseCase();
    approvedPosts.clear();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      approvedPosts.value = dataState.data!;
      return dataState.data!;
    } else {
      approvedPosts.value = [];
      return [];
    }
  }

  Future<List<PostEntity>> getPostsPending() async {
    final dataState = await _getPostsPendingUseCase();
    pendingPosts.clear();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      pendingPosts.value = dataState.data!;
      return dataState.data!;
    } else {
      pendingPosts.value = [];
      return [];
    }
  }

  Future<List<PostEntity>> getPostsRejected() async {
    final dataState = await _getPostsRejectUseCase();
    rejectedPosts.clear();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      rejectedPosts.value = dataState.data!;
      return dataState.data!;
    } else {
      rejectedPosts.value = [];
      return [];
    }
  }

  Future<List<PostEntity>> getPostsHided() async {
    final dataState = await _getPostsHidedUseCase();
    hidedPosts.clear();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      hidedPosts.value = dataState.data!;
      return dataState.data!;
    } else {
      hidedPosts.value = [];
      return [];
    }
  }

  Future<void> getPostsInit() async {
    getPostsApproved();
    getPostsPending();
    getPostsRejected();
    getPostsHided();
  }

  void navigateToDetailSceen(PostEntity post) {
    //Get.toNamed(AppRoutes.post_detail, arguments: post);
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
