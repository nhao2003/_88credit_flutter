import 'package:get/get.dart';
import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/core/utils/check_time_date.dart';
import 'package:_88credit_flutter/injection_container.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/resources/data_state.dart';
import '../../../domain/entities/nhagiare/blog/blog.dart';
import '../../../domain/usecases/blog/remote/get_all_blogs.dart';

class HomeController extends GetxController {
  String nameUser = "Minh Phan";

  RxInt unreadMessCount = 1.obs;
  RxInt unreadNotiCount = 1.obs;

  // appbar
  Greeting getGreeting() {
    return CheckTimeOfDate.getGreeting();
  }

  // loan limit
  RxInt lendLimit = 20000000.obs;
  RxInt borrowLimit = 10000000.obs;

  RxInt lendedUsed = 100000.obs;
  RxInt borrowedUsed = 5000000.obs;

  RxInt currentIndexTab = 0.obs;
  changeIndexTab(int index) {
    currentIndexTab.value = index;
  }

  // image ad
  final List<String> imgList = [
    'https://tinnhiemmang.vn/storage/photos/shares/tin-tuc/tt2022/10211a.jpg',
    'https://cdn.tima.vn/content-image/2020/4/2020440_vay-40tr-khong-the-chap.jpg',
    'https://cdn.tuoitre.vn/471584752817336320/2023/9/20/photo-1695177142803-16951771434652004020101.jpg',
    'https://image.congan.com.vn/thumbnail/CATP-480-2023-4-28/nhung-app-vay-tien-bi-bat-1_637_382_326.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1em0CudPUva4SQdZ522Qx6UA6jsDed5OA0w&usqp=CAU',
  ];
  final String fakeUrl = 'https://flutter.dev';

  void launchWebURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  // get blog
  final GetBlogsUseCase getBlogsUseCase = sl.get<GetBlogsUseCase>();
  Future<List<BlogEntity>> getBlogs() async {
    final result = await getBlogsUseCase.call();
    if (result is DataSuccess) {
      return result.data!;
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
