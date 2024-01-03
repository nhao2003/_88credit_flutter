import 'package:_88credit_flutter/features/data/data_sources/remote/bank_remote_data_source.dart';
import 'package:_88credit_flutter/features/data/data_sources/remote/requests_remote_data_source.dart';
import 'package:_88credit_flutter/features/data/data_sources/remote/user_remote_data_source.dart';
import 'package:_88credit_flutter/features/data/repository/bank_repository_impl.dart';
import 'package:_88credit_flutter/features/data/repository/media_repository_impl.dart';
import 'package:_88credit_flutter/features/domain/repository/bank_repository.dart';
import 'package:_88credit_flutter/features/domain/repository/media_repository.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/add_bank_card.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/get_all_banks.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/get_bank_cards.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/get_primary_bank_card.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/mark_as_primary_bank_card.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/delete_bank_card.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/confirm_request.dart';
import 'package:_88credit_flutter/features/domain/repository/user_repository.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/create_loan_request.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_borrowing_contracts.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_lending_contracts.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_waiting_payment.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_reject.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_sent.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/pay_loan_request.dart';
import 'package:_88credit_flutter/features/domain/usecases/media/upload_images.dart';
import 'package:_88credit_flutter/features/domain/usecases/media/upload_videos.dart';
import 'package:_88credit_flutter/features/domain/usecases/user/get_profile.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'features/data/data_sources/local/authentication_local_data_source.dart';
import 'features/data/data_sources/remote/authentication_remote_data_source.dart';
import 'features/data/data_sources/remote/media_remote_date_source.dart';
import 'features/data/repository/authentication_repository_impl.dart';
import 'features/data/repository/conversation_repository_impl.dart';
import 'features/data/repository/post_repository_impl.dart';
import 'features/data/repository/provinces_repository_impl.dart';
import 'features/data/repository/request_repository_impl.dart';
import 'features/data/repository/user_remote_repository_impl.dart';
import 'features/domain/repository/authentication_repository.dart';
import 'features/domain/repository/conversation_repository.dart';
import 'features/domain/repository/provinces_repository.dart';
import 'features/domain/repository/request_repository.dart';
import 'features/domain/usecases/authentication/check_token.dart';
import 'features/domain/usecases/authentication/sign_in.dart';
import 'features/domain/usecases/authentication/sign_out.dart';
import 'features/domain/usecases/contract/get_loan_requests_approved.dart';
import 'features/domain/usecases/contract/get_loan_requests_pending.dart';
import 'features/domain/usecases/contract/reject_request.dart';
import 'features/domain/usecases/post/remote/create_post.dart';
import 'features/domain/usecases/post/remote/get_posts_borrowing.dart';
import 'features/domain/usecases/post/remote/get_posts_hided.dart';
import 'features/domain/usecases/post/remote/get_posts_lending.dart';
import 'features/domain/usecases/post/remote/get_posts_pending.dart';
import 'features/domain/usecases/user/search_user_usecase.dart';

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

  sl.registerSingleton<MediaRemoteDataSource>(
    MediaRemoteDataSourceImpl(
      sl<Dio>(),
    ),
  );
  // post repository
  sl.registerSingleton<PostRepository>(
    PostRepositoryImpl(
      sl<PostRemoteDataSrc>(),
    ),
  );

  sl.registerSingleton<MediaRepository>(
    MediaRepositoryImpl(
      sl<MediaRemoteDataSource>(),
    ),
  );

  // use cases
  sl.registerSingleton<GetPostsUseCase>(
    GetPostsUseCase(
      sl<PostRepository>(),
    ),
  );

  sl.registerSingleton<GetPostsLendingUseCase>(
    GetPostsLendingUseCase(
      sl<PostRepository>(),
    ),
  );

  sl.registerSingleton<GetPostsBorrowingUseCase>(
    GetPostsBorrowingUseCase(
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

  sl.registerSingleton<GetPostsHidedUseCase>(
    GetPostsHidedUseCase(
      sl<PostRepository>(),
    ),
  );

  sl.registerSingleton<CreatePostsUseCase>(
    CreatePostsUseCase(
      sl<PostRepository>(),
    ),
  );

  sl.registerSingleton<UploadImagesUseCase>(
    UploadImagesUseCase(
      sl<MediaRepository>(),
    ),
  );

  sl.registerSingleton<UploadVideosUseCase>(
    UploadVideosUseCase(
      sl<MediaRepository>(),
    ),
  );

  // Contract =====================================================
  // datasource
  sl.registerSingleton<RequestRemoteDataSrc>(
    RequestRemoteDataSrcImpl(
      sl<Dio>(),
    ),
  );

  // repository
  sl.registerSingleton<RequestRepository>(
    RequestRepositoryImpl(
      sl<RequestRemoteDataSrc>(),
    ),
  );

  // use cases
  sl.registerSingleton<GetRequestUseCase>(
    GetRequestUseCase(
      sl<RequestRepository>(),
    ),
  );

  sl.registerSingleton<GetRequestApprovedUseCase>(
    GetRequestApprovedUseCase(
      sl<RequestRepository>(),
    ),
  );

  sl.registerSingleton<GetRequestPendingUseCase>(
    GetRequestPendingUseCase(
      sl<RequestRepository>(),
    ),
  );

  sl.registerSingleton<GetRequestRejectedUseCase>(
    GetRequestRejectedUseCase(
      sl<RequestRepository>(),
    ),
  );

  sl.registerSingleton<CreateRequestsUseCase>(
    CreateRequestsUseCase(
      sl<RequestRepository>(),
    ),
  );

  sl.registerSingleton<GetRequestSentUseCase>(
    GetRequestSentUseCase(
      sl<RequestRepository>(),
    ),
  );

  sl.registerSingleton<GetRequestWaitingPaymentUseCase>(
    GetRequestWaitingPaymentUseCase(
      sl<RequestRepository>(),
    ),
  );

  sl.registerSingleton<GetBorrowingContractsUseCase>(
    GetBorrowingContractsUseCase(
      sl<RequestRepository>(),
    ),
  );

  sl.registerSingleton<GetLendingContractsUseCase>(
    GetLendingContractsUseCase(
      sl<RequestRepository>(),
    ),
  );

  sl.registerSingleton<ConfirmRequestUseCase>(
    ConfirmRequestUseCase(
      sl<RequestRepository>(),
    ),
  );

  sl.registerSingleton<RejectRequestUseCase>(
    RejectRequestUseCase(
      sl<RequestRepository>(),
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

  sl.registerSingleton<PayLoanRequestUsecase>(
    PayLoanRequestUsecase(
      sl<RequestRepository>(),
    ),
  );

  sl.registerSingleton<UserRemoteDataSrc>(
    UserRemoteDataSrcImpl(
      sl<Dio>(),
    ),
  );

  sl.registerSingleton<UserRepository>(
    UserRepositoryImpl(
      sl<UserRemoteDataSrc>(),
    ),
  );

  sl.registerSingleton<SearchUserUseCase>(
    SearchUserUseCase(
      sl<UserRepository>(),
    ),
  );

  sl.registerSingleton<GetProfileUseCase>(
    GetProfileUseCase(
      sl<UserRepository>(),
    ),
  );

  // bank =====================================================
  sl.registerSingleton<BankRemoteDataSrc>(
    BankRemoteDataSrcImpl(
      sl<Dio>(),
    ),
  );

  sl.registerSingleton<BankRepository>(
    BankRepositoryImpl(
      sl<BankRemoteDataSrc>(),
    ),
  );

  sl.registerSingleton<GetAllbankUseCase>(
    GetAllbankUseCase(
      sl<BankRepository>(),
    ),
  );

  sl.registerSingleton<GetBankCardsUseCase>(
    GetBankCardsUseCase(
      sl<BankRepository>(),
    ),
  );

  sl.registerSingleton<MarkAsPrimaryBankCardsUseCase>(
    MarkAsPrimaryBankCardsUseCase(
      sl<BankRepository>(),
    ),
  );

  sl.registerSingleton<AddBankCardUseCase>(
    AddBankCardUseCase(
      sl<BankRepository>(),
    ),
  );

  sl.registerSingleton<DeleteBankCardUseCase>(
    DeleteBankCardUseCase(
      sl<BankRepository>(),
    ),
  );

  sl.registerSingleton<GetPrimaryBankCardUseCase>(
    GetPrimaryBankCardUseCase(
      sl<BankRepository>(),
    ),
  );
}
