import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/core/resources/pair.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/confirm_request.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_approved.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_pending.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_reject.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/pay_loan_request.dart';
import 'package:_88credit_flutter/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/theme/app_color.dart';
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

  Future<void> acceptRequest(LoanRequestEntity request) async {
    // confirm request => call api confirm
    bool isConfirmed = await confirmRequest(request);
    if (!isConfirmed) return;
    // create new contract
    ContractEntity contract = createContractFromRequest(request);
    // navigate to contract detail
    navToContractDetail(contract);
  }

  Future<bool> confirmRequest(LoanRequestEntity request) async {
    ConfirmRequestUseCase confirmRequestUseCase = sl<ConfirmRequestUseCase>();
    final dataState = await confirmRequestUseCase(params: request);

    if (dataState is DataSuccess) {
      Get.snackbar(
        'Xác nhận yêu cầu thành công',
        'Đã tạo hợp đồng',
        backgroundColor: AppColors.green,
        colorText: Colors.white,
      );
      return true;
    } else {
      Get.snackbar(
        'Xác nhận yêu cầu thất bại',
        '',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }

  ContractEntity createContractFromRequest(LoanRequestEntity request) {
    return ContractEntity(
      id: "123123123",
      loanContractRequestId: request.id,
      contractTemplateId: "contractTemplateId",
      lender: request.receiver,
      borrower: request.sender,
      lenderBankAccountId: request.receiverBankCardId,
      borrowerBankAccountId: request.senderBankCardId,
      loanReasonType: request.loanReasonType,
      loanReason: request.loanReason,
      amount: request.loanAmount,
      interestRate: request.interestRate,
      tenureInMonths: request.loanTenureMonths,
      overdueInterestRate: request.overdueInterestRate,
      createdAt: DateTime.now(),
      expiredAt: DateTime.now().add(const Duration(days: 30)),
    );
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

  PayLoanRequestUsecase get _payLoanRequestUsecase =>
      sl<PayLoanRequestUsecase>();
  void payContractFee() {
    _payLoanRequestUsecase(params: "52e5d5f0-7cb8-49de-be39-67936e115db9");
  }
}
