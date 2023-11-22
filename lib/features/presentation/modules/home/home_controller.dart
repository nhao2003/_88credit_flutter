import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/core/utils/check_time_date.dart';
import 'package:_88credit_flutter/features/domain/entities/posts/real_estate_post.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts.dart';
import 'package:_88credit_flutter/features/presentation/modules/search/widgets/my_search_delegate.dart';
import 'package:_88credit_flutter/injection_container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/resources/data_state.dart';

class HomeController extends GetxController {
  String nameUser = "Minh Phan";

  RxInt unreadMessCount = 1.obs;
  RxInt unreadNotiCount = 1.obs;

  // appbar
  Greeting getGreeting() {
    return CheckTimeOfDate.getGreeting();
  }

  // Search
  var textSearchController = TextEditingController();
  var searchFocusNode = FocusNode();

  onTapSearch(BuildContext context, MySearchDelegate delegate) async {
    await showSearch<String>(
      context: context,
      delegate: delegate,
    );
  }

  onChangedTextFiled(String value) {}

  // image ad
  final List<String> imgList = [
    'https://cdn.chotot.com/admincentre/D7Le2XZDgAF07oJDVyc_Gz765rWVQ5c8hwXonwYWapg/preset:raw/plain/a54ed308183c261c8529a6729ef4512c-2812912165257461362.jpg',
    'https://cdn.chotot.com/admincentre/ctc6HtBG1QICBtN5KQNCNO34k73kZn9gQLxmhOjfWw4/preset:raw/plain/1bfd526b0b6c995da1c20eb5f3ba0c51-2805772162331331393.jpg',
    'https://cdn.chotot.com/admincentre/ICGqIPhBAn559vSI4v7jaBAYFYegeRG7xSfUJ6tkugI/preset:raw/plain/6ec3994f81e14d768dfc467847ce430c-2820195948173896828.jpg',
    'https://cdn.chotot.com/admincentre/83O9GjTqqxMohxXA1DcGEojtznUAIxJYWwTDMhhWp88/preset:raw/plain/bb0f1e32befe115598c292f0b7434fe7-2829010373569559918.jpg',
    'https://cdn.chotot.com/admincentre/586665ff-021b-4eb2-a0a2-acf2405ebedc_banner.jpg',
  ];
  final String fakeUrl = 'https://flutter.dev';

  void launchWebURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  // near by
  List<String> locationNearby = [
    "Thủ Đức",
    "Quận 10",
    "Bình Thạnh",
    "Gò Vấp",
    "Tân Bình",
    "Quận 12",
  ];

  // get all posts
  final GetPostsUseCase _getPostsUseCase = sl<GetPostsUseCase>();
  Future<List<RealEstatePostEntity>> getAllPosts() async {
    final dataState = await _getPostsUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      return dataState.data!;
    } else if (dataState is DataFailed) {
      return [];
    } else {
      return [];
    }
  }

  // navigate to notification screen
  void navigateToNotificationScreen() {
    Get.toNamed(AppRoutes.notifications);
  }

  void navigateToChatScreen() {
    Get.toNamed(AppRoutes.chat);
  }
}
