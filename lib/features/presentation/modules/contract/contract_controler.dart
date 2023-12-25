import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/core/resources/pair.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_approved.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_pending.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_reject.dart';
import 'package:_88credit_flutter/injection_container.dart';
import 'package:get/get.dart';
import '../../../../core/resources/data_state.dart';
import '../../../domain/entities/credit/user.dart';
import '../../../domain/enums/role.dart';
import '../../../domain/enums/user_status.dart';

class ContractController extends GetxController {
  RxList<LoanRequestEntity> approvedRequests = <LoanRequestEntity>[].obs;
  RxList<LoanRequestEntity> pendingRequests = <LoanRequestEntity>[].obs;
  RxList<LoanRequestEntity> rejectedRequests = <LoanRequestEntity>[].obs;
  RxList<ContractEntity> lendingContracts = <ContractEntity>[].obs;
  RxList<ContractEntity> borrowingContracts = <ContractEntity>[].obs;

  // LoanRequestEntity getMockRequest(LoanContractRequestStatus status) {
  //   return LoanRequestEntity(
  //     id: "loancontractrequestid",
  //     status: status,
  //     sender: UserEntity(
  //       id: "fec2579d-fe55-4da6-874a-dd5bab669cf8",
  //       status: UserStatus.notUpdate,
  //       isIdentityVerified: false,
  //       role: Role.user,
  //       email: "nhao@qa.team",
  //       address: null,
  //       firstName: "Nhật",
  //       lastName: "Hào",
  //       gender: false,
  //       avatar:
  //           "https://i.pinimg.com/1200x/0e/3d/bb/0e3dbbb0a606bb4d677909a33b6f1dc6.jpg",
  //       dob: null,
  //       phone: "123456789",
  //       lastActiveAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
  //       createdAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
  //       updatedAt: null,
  //       bannedUtil: null,
  //       banReason: null,
  //     ),
  //     receiver: UserEntity(
  //       id: "fec2579d-fe55-4da6-874a-dd5bab669cf8",
  //       status: UserStatus.notUpdate,
  //       isIdentityVerified: false,
  //       role: Role.user,
  //       email: "nhao@qa.team",
  //       address: null,
  //       firstName: "Minh",
  //       lastName: "Phan",
  //       gender: false,
  //       avatar: "https://picsum.photos/200/300?random=4",
  //       dob: null,
  //       phone: "123456789",
  //       lastActiveAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
  //       createdAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
  //       updatedAt: null,
  //       bannedUtil: null,
  //       banReason: null,
  //     ),
  //     description:
  //         "Our loan products are designed to provide flexible and affordable financing solutions to meet your specific needs. Whether you're looking to consolidate debt, finance a major purchase, or cover unexpected expenses, we offer a variety of loan options with competitive interest rates and flexible repayment terms. Our application process is quick and easy, and you can apply online or in-person at one of our branches. Our knowledgeable loan officers are available to answer any questions you may have and help you select the best loan for your situation. Contact us today to learn more about our loan products and how we can help you achieve your financial goals.",
  //     loanAmount: 5050000,
  //     interestRate: 0.1,
  //     overdueInterestRate: 0.1,
  //     loanTenureMonths: 12,
  //     loanReasonType: LoanReasonTypes.business,
  //     loanReason:
  //         "Our loan products can be used for a variety of reasons, from covering unexpected expenses to financing major purchases. Whether you're looking to consolidate high-interest debt, make home improvements, pay for medical expenses, or cover educational costs, we offer loans with flexible repayment terms and competitive interest rates. Our loan officers are available to work with you to understand your specific needs and help you select the best loan option for your situation. Contact us today to learn more about our loan products and how we can help you achieve your financial goals.",
  //     videoConfirmation: "videoConfirmation",
  //     portaitPhoto:
  //         "https://img.freepik.com/premium-photo/anime-male-avatar_950633-956.jpg",
  //     idCardFrontPhoto:
  //         "https://congan.tiengiang.gov.vn/documents/2261410/29734928/image005.jpg/a25a6795-e346-4d5c-9fc8-ad977f68c258?t=1615901441563",
  //     idCardBackPhoto:
  //         "https://ims.baoyenbai.com.vn/NewsImg/3_2023/260633_5-3-mau-the.jpg",
  //     senderBankCardId: "senderBankCardId",
  //     receiverBankCardId: "receiverBankCardId",
  //     rejectedReason: "rejectedReason",
  //     createdAt: DateTime.now(),
  //     updatedAt: DateTime.now(),
  //     deletedAt: DateTime.now(),
  //   );
  // }

  ContractEntity getMockContract() {
    return ContractEntity(
      id: "123123123",
      loanContractRequestId: "loanContractRequestId",
      contractTemplateId: "contractTemplateId",
      lender: UserEntity(
        id: "fec2579d-fe55-4da6-874a-dd5bab669cf8",
        status: UserStatus.notUpdate,
        isIdentityVerified: false,
        role: Role.user,
        email: "nhao@qa.team",
        address: null,
        firstName: "Minh",
        lastName: "Phan",
        gender: false,
        avatar: "https://picsum.photos/200/300?random=4",
        dob: null,
        phone: "123456789",
        lastActiveAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
        createdAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
        updatedAt: null,
        bannedUtil: null,
        banReason: null,
      ),
      borrower: UserEntity(
        id: "fec2579d-fe55-4da6-874a-dd5bab669cf8",
        status: UserStatus.notUpdate,
        isIdentityVerified: false,
        role: Role.user,
        email: "nhao@qa.team",
        address: null,
        firstName: "Nhật",
        lastName: "Hào",
        gender: false,
        avatar:
            "https://i.pinimg.com/1200x/0e/3d/bb/0e3dbbb0a606bb4d677909a33b6f1dc6.jpg",
        dob: null,
        phone: "123456789",
        lastActiveAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
        createdAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
        updatedAt: null,
        bannedUtil: null,
        banReason: null,
      ),
      lenderBankAccountId: "lenderBankAccountId",
      borrowerBankAccountId: "borrowerBankAccountId",
      loanReasonType: LoanReasonTypes.business,
      loanReason:
          "Our loan products can be used for a variety of reasons, from covering unexpected expenses to financing major purchases. Whether you're looking to consolidate high-interest debt, make home improvements, pay for medical expenses, or cover educational costs, we offer loans with flexible repayment terms and competitive interest rates. Our loan officers are available to work with you to understand your specific needs and help you select the best loan option for your situation. Contact us today to learn more about our loan products and how we can help you achieve your financial goals.",
      amount: 5050000,
      interestRate: 0.1,
      tenureInMonths: 12,
      overdueInterestRate: 0.15,
      createdAt: DateTime.now(),
      expiredAt: DateTime.now(),
    );
  }

  Future<Pair<int, List<LoanRequestEntity>>> getRequestsApproved(
      {int? page = 1}) async {
    final GetRequestApprovedUseCase getPostsApprovedUseCase =
        sl<GetRequestApprovedUseCase>();

    final dataState = await getPostsApprovedUseCase(params: page);
    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      return dataState.data!;
    } else {
      return Pair(1, []);
    }
  }

  Future<Pair<int, List<LoanRequestEntity>>> getRequestsPending(
      {int? page = 1}) async {
    final GetRequestPendingUseCase getPostsApprovedUseCase =
        sl<GetRequestPendingUseCase>();

    final dataState = await getPostsApprovedUseCase(params: page);
    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      return dataState.data!;
    } else {
      return Pair(1, []);
    }
  }

  Future<Pair<int, List<LoanRequestEntity>>> getRequestsRejected(
      {int? page = 1}) async {
    final GetRequestRejectedUseCase getPostsApprovedUseCase =
        sl<GetRequestRejectedUseCase>();

    final dataState = await getPostsApprovedUseCase(params: page);
    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      return dataState.data!;
    } else {
      return Pair(1, []);
    }
  }

  Future<Pair<int, List<ContractEntity>>> getLendingContract(
      {int? page = 1}) async {
    // final dataState = await _getPostsApprovedUseCase(params: page);
    // if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
    //   return dataState.data!;
    // } else {
    //   return Pair(1, []);
    // }
    return Pair(1, [getMockContract()]);
  }

  Future<Pair<int, List<ContractEntity>>> getBorrowingContract(
      {int? page = 1}) async {
    // final dataState = await _getPostsApprovedUseCase(params: page);
    // if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
    //   return dataState.data!;
    // } else {
    //   return Pair(1, []);
    // }
    return Pair(1, [getMockContract()]);
  }

  void navToProfile(UserEntity user) {
    Get.toNamed(AppRoutes.userProfile, arguments: user);
  }

  void handleRejectRequest(LoanRequestEntity request, String reason) {
    // _rejectRequestUseCase(params: request);
  }

  void navToContractDetail(ContractEntity contract) {
    Get.toNamed(AppRoutes.contractDetail, arguments: contract);
  }

  void navToCreateRequest() {
    Get.toNamed(AppRoutes.createRequest);
  }
}
