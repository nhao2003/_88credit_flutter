import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/features/domain/entities/posts/real_estate_post.dart';
import 'package:_88credit_flutter/features/presentation/modules/post_detail/widgets/motel_card.dart';
import 'package:_88credit_flutter/features/presentation/modules/post_detail/widgets/office_card.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../injection_container.dart';
import '../../../domain/entities/properties/apartment.dart';
import '../../../domain/entities/properties/house.dart';
import '../../../domain/entities/properties/land.dart';
import '../../../domain/entities/properties/motel.dart';
import '../../../domain/entities/properties/office.dart';
import '../../../domain/entities/properties/property_feature.dart';
import '../../../domain/usecases/post/remote/get_posts.dart';
import 'widgets/apartment_card.dart';
import 'widgets/house_card.dart';
import 'widgets/land_card.dart';

class PostDetailController extends GetxController {
  final RealEstatePostEntity post = Get.arguments as RealEstatePostEntity;
  PropertyFeature? feature;
  late bool isYourPost = false;

  Widget getDetailCard() {
    feature = PropertyFeature.fromJson(post.typeId!, post.features!);
    if (feature is Apartment) {
      return ApartmentCard(feature: feature as Apartment);
    } else if (feature is House) {
      return HouseCard(feature: feature as House);
    } else if (feature is Land) {
      return LandCard(feature: feature as Land);
    } else if (feature is Office) {
      return OfficeCard(feature: feature as Office);
    } else if (feature is Motel) {
      return MotelCard(feature: feature as Motel);
    } else {
      return const SizedBox();
    }
  }

  // get all posts
  final GetPostsUseCase _getPostsUseCase = sl<GetPostsUseCase>();
  Future<List<RealEstatePostEntity>> getRelatePosts() async {
    final dataState = await _getPostsUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      return dataState.data!;
    } else if (dataState is DataFailed) {
      return [];
    } else {
      return [];
    }
  }

  void likePost() async {
    // PostRepository postRepo = GetIt.instance<PostRepository>();
    // if (!liked.value && !isLoading) {
    //   isLoading = true;
    //   await postRepo.likePost(post.id).then((value) {
    //     liked.value = true;
    //     numOfLikes.value++;
    //     isLoading = false;
    //   });
    // } else if (liked.value && !isLoading) {
    //   isLoading = true;
    //   await postRepo.unlikePost(post.id).then((value) {
    //     liked.value = false;
    //     numOfLikes.value--;
    //     isLoading = false;
    //   });
    // }
  }

  void navToChat() {
    Get.toNamed(AppRoutes.chatDetail, arguments: post.user);
  }

  void navToUserProfile() {
    Get.toNamed(AppRoutes.userProfile, arguments: post.user);
  }

  void launchPhone() {
    launchUrl(Uri.parse("tel://${post.user!.phone}"));
  }

  void launchSms() {
    launchUrl(Uri.parse("sms://${post.user!.phone}"));
  }
}
