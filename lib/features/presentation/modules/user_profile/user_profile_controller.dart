import 'package:get/get.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/pair.dart';
import '../../../../injection_container.dart';
import '../../../domain/entities/credit/post.dart';
import '../../../domain/entities/credit/user.dart';
import '../../../domain/usecases/post/remote/get_posts.dart';

class UserProfileController extends GetxController {
  UserEntity? user = Get.arguments;

  int numberPost = 122;
  int numberFollower = 332;
  int numberFollowing = 94;

  bool isFollow = false;

  RxString numOfPosts = "-".obs;

  // get all posts
  final GetPostsUseCase _getPostsUseCase = sl<GetPostsUseCase>();
  Future<List<PostEntity>> getAllPosts({int? page = 1}) async {
    final dataState = await _getPostsUseCase(
      params: Pair(user!.id, page),
    );

    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      numOfPosts.value = dataState.data!.second.length.toString();
      return dataState.data!.second;
    } else if (dataState is DataFailed) {
      return [];
    } else {
      return [];
    }
  }
}
