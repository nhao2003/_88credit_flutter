import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:_88credit_flutter/features/data/data_sources/remote/blog_data_source.dart';
import 'package:_88credit_flutter/features/data/data_sources/remote/conversation_remote_data_source.dart';
import 'package:_88credit_flutter/features/data/data_sources/remote/membership_package_data_source.dart';
import 'package:_88credit_flutter/features/data/data_sources/remote/post_remote_data_sources.dart';
import 'package:_88credit_flutter/features/data/data_sources/remote/transaction_data_source.dart';
import 'package:_88credit_flutter/features/data/repository/blog_repository_impl.dart';
import 'package:_88credit_flutter/features/data/repository/membership_package_respository_impl.dart';
import 'package:_88credit_flutter/features/data/repository/transaction_repository_impl.dart';
import 'package:_88credit_flutter/features/domain/repository/blog_repository.dart';
import 'package:_88credit_flutter/features/domain/repository/membership_package_repository.dart';
import 'package:_88credit_flutter/features/domain/repository/post_repository.dart';
import 'package:_88credit_flutter/features/domain/repository/transaction_repository.dart';
import 'package:_88credit_flutter/features/domain/usecases/authentication/get_access_token.dart';
import 'package:_88credit_flutter/features/domain/usecases/authentication/get_user_id.dart';
import 'package:_88credit_flutter/features/domain/usecases/authentication/sign_up.dart';
import 'package:_88credit_flutter/features/domain/usecases/blog/remote/get_all_blogs.dart';
import 'package:_88credit_flutter/features/domain/usecases/address/get_address.dart';
import 'package:_88credit_flutter/features/domain/usecases/address/get_province_names.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_approved.dart';
import 'package:_88credit_flutter/features/domain/usecases/post/remote/get_posts_rejected.dart';
import 'package:_88credit_flutter/features/domain/usecases/purchase/get_membership_package.dart';
import 'package:_88credit_flutter/features/domain/usecases/purchase/get_order.dart';
import 'package:_88credit_flutter/features/domain/usecases/purchase/get_transaction.dart';
import 'package:_88credit_flutter/features/domain/usecases/tasks/local/get_local_task.dart';
import 'package:_88credit_flutter/features/domain/usecases/tasks/local/remove_task.dart';
import 'package:_88credit_flutter/features/domain/usecases/tasks/local/save_local_task.dart';
import 'package:_88credit_flutter/features/domain/usecases/tasks/remote/get_tasks.dart';
import 'package:_88credit_flutter/features/domain/usecases/tasks/remote/remove_task.dart';
import 'package:_88credit_flutter/features/domain/usecases/tasks/remote/save_task.dart';
import 'package:_88credit_flutter/features/domain/usecases/tasks/remote/update_task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'features/data/data_sources/local/authentication_local_data_source.dart';
import 'features/data/data_sources/remote/authentication_remote_data_source.dart';
import 'features/data/repository/authentication_repository_impl.dart';
import 'features/data/repository/conversation_repository_impl.dart';
import 'features/data/repository/post_repository_impl.dart';
import 'features/data/repository/provinces_repository_impl.dart';
import 'features/domain/repository/authentication_repository.dart';
import 'features/domain/repository/conversation_repository.dart';
import 'features/domain/repository/provinces_repository.dart';
import 'features/domain/usecases/authentication/check_token.dart';
import 'features/domain/usecases/authentication/sign_in.dart';
import 'features/domain/usecases/authentication/sign_out.dart';
import 'features/domain/usecases/post/remote/get_posts_expired.dart';
import 'features/domain/usecases/post/remote/get_posts_hided.dart';
import 'features/domain/usecases/post/remote/get_posts_pending.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());
  // Login =====================================================
  // datasource
  sl.registerSingleton<AuthenRemoteDataSrc>(
    AuthenRemoteDataSrcImpl(
      sl<Dio>(),
    ),
  );
  sl.registerSingleton<AuthenLocalDataSrc>(
    AuthenLocalDataSrcImpl(await SharedPreferences.getInstance()),
  );
  // repository
  sl.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(
      sl<AuthenRemoteDataSrc>(),
      sl<AuthenLocalDataSrc>(),
    ),
  );
  // use cases

  sl.registerSingleton<CheckTokenUseCase>(
    CheckTokenUseCase(
      sl<AuthenticationRepository>(),
    ),
  );

  sl.registerSingleton<GetUserIdUseCase>(
    GetUserIdUseCase(
      sl<AuthenticationRepository>(),
    ),
  );

  sl.registerSingleton<GetAccessTokenUseCase>(
    GetAccessTokenUseCase(
      sl<AuthenticationRepository>(),
    ),
  );

  //Post=====================================================
  // datasource
  sl.registerSingleton<PostRemoteDataSrc>(
    PostRemoteDataSrcImpl(
      sl<Dio>(),
    ),
  );
  // post repository
  sl.registerSingleton<PostRepository>(
    PostRepositoryImpl(
      sl<PostRemoteDataSrc>(),
    ),
  );

  // use cases
  sl.registerSingleton<GetPostsUseCase>(
    GetPostsUseCase(
      sl<PostRepository>(),
    ),
  );

  sl.registerSingleton<GetPostsApprovedUseCase>(
    GetPostsApprovedUseCase(
      sl<PostRepository>(),
    ),
  );

  sl.registerSingleton<GetPostsPendingUseCase>(
    GetPostsPendingUseCase(
      sl<PostRepository>(),
    ),
  );

  sl.registerSingleton<GetPostsRejectUseCase>(
    GetPostsRejectUseCase(
      sl<PostRepository>(),
    ),
  );

  sl.registerSingleton<GetPostsExpiredUseCase>(
    GetPostsExpiredUseCase(
      sl<PostRepository>(),
    ),
  );

  sl.registerSingleton<GetPostsHidedUseCase>(
    GetPostsHidedUseCase(
      sl<PostRepository>(),
    ),
  );

  //MembershipPackage=====================================================
  // datasource
  sl.registerSingleton<MembershipPackageRemoteDataSrc>(
    MembershipPackageRemoteDataSrcImpl(
      sl<Dio>(),
    ),
  );
  // membership package repository'
  sl.registerSingleton<MembershipPackageRepository>(
    MembershipPackageRepositoryImpl(
      sl<MembershipPackageRemoteDataSrc>(),
    ),
  );

  // use cases
  sl.registerSingleton<GetMembershipPackageUseCase>(
    GetMembershipPackageUseCase(
      sl<MembershipPackageRepository>(),
    ),
  );

  //Transaction=====================================================
  sl.registerSingleton<TransactionRemoteDataSrc>(
    TransactionRemoteDataSrcImpl(
      sl<Dio>(),
    ),
  );

  sl.registerSingleton<TransactionRepository>(
    TranstractionRepositoryImpl(
      sl<TransactionRemoteDataSrc>(),
    ),
  );

  // use cases
  sl.registerSingleton<GetTransactionUseCase>(
    GetTransactionUseCase(
      sl<TransactionRepository>(),
    ),
  );

  sl.registerSingleton<GetOrderMembershipPackageUseCase>(
    GetOrderMembershipPackageUseCase(
      sl<MembershipPackageRepository>(),
    ),
  );

  // Blog =====================================================
  // blog repository
  sl.registerSingleton<BlogRemoteDataSrc>(
    BlogRemoteDataSrcImpl(
      sl<Dio>(),
    ),
  );

  sl.registerSingleton<BlogRepository>(
    BlogRepositoryImpl(
      sl<BlogRemoteDataSrc>(),
    ),
  );

  sl.registerSingleton<GetBlogsUseCase>(
    GetBlogsUseCase(
      sl<BlogRepository>(),
    ),
  );

  // Provinces =====================================================
  // provinces repository
  sl.registerSingleton<ProvincesRepository>(
    ProvincesRepositoryImpl(),
  );
  // use cases
  sl.registerSingleton<GetAddressUseCase>(
    GetAddressUseCase(
      sl<ProvincesRepository>(),
    ),
  );

  // Chat =====================================================
  sl.registerSingleton<ConversationRemoteDataSource>(
    ConversationRemoteDataSourceImpl(),
  );

  sl.registerSingleton<ConversationRepository>(
    ConversationRepositoryImpl(
      sl<ConversationRemoteDataSource>(),
      sl<AuthenLocalDataSrc>(),
    ),
  );

  sl.registerSingleton<GetProvinceNamesUseCase>(
    GetProvinceNamesUseCase(
      sl<ProvincesRepository>(),
    ),
  );

  sl.registerSingleton<SignInUseCase>(
    SignInUseCase(
      sl<AuthenticationRepository>(),
      sl<ConversationRepository>(),
    ),
  );

  sl.registerSingleton<SignOutUseCase>(
    SignOutUseCase(
      sl<AuthenticationRepository>(),
    ),
  );

  sl.registerSingleton<SignUpUseCase>(
    SignUpUseCase(
      sl<AuthenticationRepository>(),
      sl<ConversationRepository>(),
    ),
  );
}
