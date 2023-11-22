import 'package:get/get.dart';
import 'package:_88credit_flutter/features/domain/entities/posts/real_estate_post.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_approved.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_expired.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_hided.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_pending.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_rejected.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../injection_container.dart';

class PostManagementController extends GetxController {
  RxList<RealEstatePostEntity> pendingPosts = <RealEstatePostEntity>[].obs;
  RxList<RealEstatePostEntity> approvedPosts = <RealEstatePostEntity>[].obs;
  RxList<RealEstatePostEntity> rejectedPosts = <RealEstatePostEntity>[].obs;
  RxList<RealEstatePostEntity> hidedPosts = <RealEstatePostEntity>[].obs;
  RxList<RealEstatePostEntity> expiredPosts = <RealEstatePostEntity>[].obs;

  List<String> typePosts = [
    "Đã đăng",
    "Chờ duyệt",
    "Bị từ chối",
    "Đã ẩn",
    "Hết hạn",
  ];

  // get all posts
  final GetPostsApprovedUseCase _getPostsApprovedUseCase =
      sl<GetPostsApprovedUseCase>();
  final GetPostsPendingUseCase _getPostsPendingUseCase =
      sl<GetPostsPendingUseCase>();
  final GetPostsExpiredUseCase _getPostsExpiredUseCase =
      sl<GetPostsExpiredUseCase>();
  final GetPostsRejectUseCase _getPostsRejectUseCase =
      sl<GetPostsRejectUseCase>();
  final GetPostsHidedUseCase _getPostsHidedUseCase = sl<GetPostsHidedUseCase>();

  Future<List<RealEstatePostEntity>> getPostsApproved() async {
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

  Future<List<RealEstatePostEntity>> getPostsPending() async {
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

  Future<List<RealEstatePostEntity>> getPostsExpired() async {
    final dataState = await _getPostsExpiredUseCase();
    expiredPosts.clear();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      expiredPosts.value = dataState.data!;
      return dataState.data!;
    } else {
      expiredPosts.value = [];
      return [];
    }
  }

  Future<List<RealEstatePostEntity>> getPostsRejected() async {
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

  Future<List<RealEstatePostEntity>> getPostsHided() async {
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
    getPostsExpired();
    getPostsRejected();
    getPostsHided();
  }

  void navigateToDetailSceen(RealEstatePostEntity post) {
    //Get.toNamed(AppRoutes.post_detail, arguments: post);
  }

  void showPost(RealEstatePostEntity post) async {
    //await repository.hideOrUnHidePost(post.id, false);
    await getPostsInit();
  }

  void hidePost(RealEstatePostEntity post) async {
    //await repository.hideOrUnHidePost(post.id, true);
    await getPostsInit();
  }

  void editPost(RealEstatePostEntity post) async {
    // TODO: implement editPost
    // edit post

    // Get.toNamed(AppRoutes.post, parameters: {
    //   "id": post.id,
    //   'type': post.type.toString(),
    // });
  }

  void deletePost(RealEstatePostEntity post) async {
    //await repository.deletePost(post.id);
    await getPostsInit();
  }

  void extensionPost(RealEstatePostEntity post) async {
    //await repository.extendPostExpiryDate(post.id, true);
    await getPostsInit();
  }
}
