import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import 'package:get/get.dart';

import '../../../../injection_container.dart';
import '../../../domain/usecases/authentication/get_user_id.dart';

class PostDetailController extends GetxController {
  final PostEntity post = Get.arguments as PostEntity;

  late bool isYourPost = false;
  final int numOfStars = 4;

  final RxBool isLiked = false.obs;

  GetUserIdUseCase get _getUserIdUseCase => sl<GetUserIdUseCase>();
  @override
  onInit() async {
    super.onInit();
    isYourPost = (post.user!.id == await _getUserIdUseCase());
  }

  toggleIsLiked() {
    isLiked.value = !isLiked.value;
  }

  void navToUserProfile() {
    Get.toNamed(AppRoutes.userProfile, arguments: post.user);
  }

  void likePost() async {}
}
