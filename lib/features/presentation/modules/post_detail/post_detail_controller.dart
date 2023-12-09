import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  final PostEntity post = Get.arguments as PostEntity;

  late bool isYourPost = false;
  final int numOfStars = 4;

  final RxBool isLiked = false.obs;
  toggleIsLiked() {
    isLiked.value = !isLiked.value;
  }

  void navToUserProfile() {
    Get.toNamed(AppRoutes.userProfile);
  }

  void likePost() async {}
}
