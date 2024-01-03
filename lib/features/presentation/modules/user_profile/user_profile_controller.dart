import 'dart:io';

import 'package:get/get.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/pair.dart';
import '../../../../injection_container.dart';
import '../../../domain/entities/credit/post.dart';
import '../../../domain/entities/credit/user.dart';
import '../../../domain/usecases/authentication/get_user_id.dart';
import '../../../domain/usecases/post/remote/get_posts.dart';

class UserProfileController extends GetxController {
  UserEntity? user = Get.arguments;

  GetUserIdUseCase get _getUserIdUseCase => sl<GetUserIdUseCase>();

  void checkIsMe() async {
    isMe.value = (user!.id == await _getUserIdUseCase());
  }

  void navToCreateRequest() {
    Get.toNamed(AppRoutes.createRequest, arguments: user);
  }

  void handleReportUser(UserEntity user, String reason, File image) {
    print(reason);
  }

  int numberPost = 122;
  int numberFollower = 332;
  int numberFollowing = 94;

  RxBool isFollow = false.obs;

  RxBool isMe = false.obs;

  RxString numOfPosts = "-".obs;

  void toggleIsFollow() {
    isFollow.value = !isFollow.value;
    update();
  }

  // get all posts
  RxList<PostEntity> userPosts = <PostEntity>[].obs;
  final GetPostsUseCase _getPostsUseCase = sl<GetPostsUseCase>();
  Future<Pair<int, List<PostEntity>>> getAllPosts({int? page = 1}) async {
    final dataState = await _getPostsUseCase(
      params: Pair(user!.id, page),
    );

    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      numOfPosts.value = dataState.data!.second.length.toString();
      return dataState.data!;
    } else if (dataState is DataFailed) {
      return Pair(1, []);
    } else {
      return Pair(1, []);
    }
  }
}
