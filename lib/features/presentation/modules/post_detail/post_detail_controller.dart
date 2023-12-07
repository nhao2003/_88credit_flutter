import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  final PostEntity post = Get.arguments as PostEntity;
  late bool isYourPost = false;
  void likePost() async {}
}
