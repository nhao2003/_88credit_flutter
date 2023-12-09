import 'package:get/get.dart';
import '../../../../core/resources/data_state.dart';
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

  // get all posts
  final GetPostsUseCase _getPostsUseCase = sl<GetPostsUseCase>();
  Future<List<PostEntity>> getAllPosts() async {
    final dataState = await _getPostsUseCase(params: user!.id);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      return dataState.data!;
    } else if (dataState is DataFailed) {
      return [];
    } else {
      return [];
    }
  }
}
