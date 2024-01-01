import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/core/resources/pair.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/confirm_request.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_borrowing_contracts.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_lending_contracts.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_approved.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_pending.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_reject.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_sent.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/pay_loan_request.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/reject_request.dart';
import 'package:_88credit_flutter/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zalopay_sdk/flutter_zalopay_sdk.dart';
import 'package:get/get.dart';
import '../../../../config/theme/app_color.dart';
import '../../../../core/resources/data_state.dart';
import '../../../domain/entities/credit/user.dart';
import '../pdf_view/pdf_viewer_screen.dart';

class ContractController extends GetxController {
  RxList<LoanRequestEntity> approvedRequests = <LoanRequestEntity>[].obs;
  RxList<LoanRequestEntity> pendingRequests = <LoanRequestEntity>[].obs;
  RxList<LoanRequestEntity> sentRequests = <LoanRequestEntity>[].obs;
  RxList<LoanRequestEntity> rejectedRequests = <LoanRequestEntity>[].obs;
  RxList<ContractEntity> lendingContracts = <ContractEntity>[].obs;
  RxList<ContractEntity> borrowingContracts = <ContractEntity>[].obs;

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

  Future<Pair<int, List<LoanRequestEntity>>> getRequestsSent(
      {int? page = 1}) async {
    final GetRequestSentUseCase getPostsApprovedUseCase =
        sl<GetRequestSentUseCase>();

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
    final GetLendingContractsUseCase getLendingContractsUseCase =
        sl<GetLendingContractsUseCase>();

    final dataState = await getLendingContractsUseCase(params: page);
    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      return dataState.data!;
    } else {
      return Pair(1, []);
    }
  }

  Future<Pair<int, List<ContractEntity>>> getBorrowingContract(
      {int? page = 1}) async {
    final GetBorrowingContractsUseCase getBorrowingContractsUseCase =
        sl<GetBorrowingContractsUseCase>();

    final dataState = await getBorrowingContractsUseCase(params: page);
    if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
      return dataState.data!;
    } else {
      return Pair(1, []);
    }
  }

  Future<void> rejectRequest(LoanRequestEntity request, String reason) async {
    // reject request => call api reject
    RejectRequestUseCase rejectRequestUseCase = sl<RejectRequestUseCase>();
    final dataState = await rejectRequestUseCase(params: Pair(request, reason));

    if (dataState is DataSuccess) {
      Get.snackbar(
        'Từ chối yêu cầu thành công',
        'Xem thông tin trong mục từ chối',
        backgroundColor: AppColors.green,
        colorText: Colors.white,
      );
      Get.back();
    } else {
      Get.snackbar(
        'Từ chối yêu cầu thất bại',
        '',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
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
      lenderBankCardId: request.receiverBankCardId,
      borrowerBankCardId: request.senderBankCardId,
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

  void navToContractDetail(ContractEntity contract) {
    Get.toNamed(AppRoutes.contractDetail, arguments: [contract, true]);
  }

  void navToCreateRequest() {
    Get.toNamed(AppRoutes.createRequest);
  }

  PayLoanRequestUsecase get _payLoanRequestUsecase =>
      sl<PayLoanRequestUsecase>();
  Future<void> payContractFee() async {
    final value = await _payLoanRequestUsecase.call(
        params: "52e5d5f0-7cb8-49de-be39-67936e115db9");
    FlutterZaloPayStatus status;
    print("value: $value");
    if (value is DataSuccess) {
      status = value.data ?? FlutterZaloPayStatus.failed;
    } else {
      status = FlutterZaloPayStatus.failed;
    }
    if (status == FlutterZaloPayStatus.success) {
      Get.offAndToNamed(AppRoutes.bottomBar);
    }
  }

  // navigate to pdf screen
  void navToPdfScreen(ContractEntity contract) {
    Get.to(() => PdfViewerScreen(contract: contract));
  }
}
