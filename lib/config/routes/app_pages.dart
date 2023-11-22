import 'package:get/get.dart';
import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/features/presentation/modules/account/account_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/account/screens/account_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/bottom_bar/bottom_bar_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/bottom_bar/bottom_bar_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/chat/chat_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/chat/screens/chat_detail_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/chat/screens/chat_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/create_post_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_post/screens/create_post_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/home/home_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/home/screens/home_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/login/login_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/login/screens/forgot_password.dart';
import 'package:_88credit_flutter/features/presentation/modules/login/screens/login_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/login/screens/register_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/login/screens/update_info_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/login/screens/update_password.dart';
import 'package:_88credit_flutter/features/presentation/modules/notification/notification_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/notification/screens/notification_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/post_detail/post_detail_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/post_detail/screens/post_detail_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/post_management/post_management_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/post_management/screens/post_management_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/purchase/purchase_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/purchase/screens/purchase_choose_plan.dart';
import 'package:_88credit_flutter/features/presentation/modules/search/screens/search_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/search/search_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/setting/screens/setting_screen.dart';
import 'package:_88credit_flutter/features/presentation/modules/setting/setting_binding.dart';
import 'package:_88credit_flutter/features/presentation/modules/user_profile/screens/user_profile_screen.dart';
import '../../features/presentation/modules/purchase/screens/purchase_screen.dart';
import '../../features/presentation/modules/user_profile/user_profile_binding.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.fogot,
      page: () => const ForgotPasswordScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const UpdatePasswordScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.updateInfo,
      page: () => const UpdateInfoScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomBar,
      page: () => const BottomBarScreen(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.postManagement,
      page: () => const PostManagementScreen(),
      binding: PostManagementBinding(),
    ),
    GetPage(
      name: AppRoutes.createPost,
      page: () => CreatePostScreen(),
      binding: CreatePostBinding(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => NotificationScreen(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: AppRoutes.account,
      page: () => AccountScreen(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: AppRoutes.purchase,
      page: () => PurchaseScreen(),
      binding: PurchaseBinding(),
    ),
    GetPage(
      name: AppRoutes.purchaseChoosePlan,
      page: () => PurchaseChoosePlanScreen(),
    ),
    GetPage(
      name: AppRoutes.postDetail,
      page: () => PostDetailScreen(),
      binding: PostDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => SettingScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.userProfile,
      page: () => UserProfileScreen(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.userProfile,
      page: () => UserProfileScreen(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => ChatScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.chatDetail,
      page: () => ChatDetailScreen(),
      binding: ChatBinding(),
    ),
  ];
}