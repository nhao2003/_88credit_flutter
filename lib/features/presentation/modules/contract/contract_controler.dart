import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/core/resources/pair.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/get_primary_bank_card.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/confirm_request.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_borrowing_contracts.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_lending_contracts.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_approved.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_pending.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_reject.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_sent.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/get_loan_requests_waiting_payment.dart';
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
import 'package:flutter/services.dart';

class ContractController extends GetxController {
  RxList<LoanRequestEntity> approvedRequests = <LoanRequestEntity>[].obs;
  RxList<LoanRequestEntity> pendingRequests = <LoanRequestEntity>[].obs;
  RxList<LoanRequestEntity> waitingPaymentRequests = <LoanRequestEntity>[].obs;
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

  Future<Pair<int, List<LoanRequestEntity>>> getRequestsWaitingPayment(
      {int? page = 1}) async {
    final GetRequestWaitingPaymentUseCase getPostsApprovedUseCase =
        sl<GetRequestWaitingPaymentUseCase>();

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

  RxBool isConfirming = false.obs;
  Future<bool> confirmRequest(LoanRequestEntity request) async {
    ConfirmRequestUseCase confirmRequestUseCase = sl<ConfirmRequestUseCase>();
    isConfirming.value = true;
    final dataState = await confirmRequestUseCase(params: request);
    isConfirming.value = false;

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

  void reviewContract(LoanRequestEntity request) async {
    ContractEntity contract = await createContractFromRequest(request);
    // navigate to contract detail
    navToContractDetail(contract);
  }

  late BankCardEntity primaryBankCard;
  GetPrimaryBankCardUseCase getPrimaryBankCardUseCase =
      sl<GetPrimaryBankCardUseCase>();

  Future<void> getPrimaryBankCard() async {
    print("getPrimaryBankCard");
    final dataState = await getPrimaryBankCardUseCase();
    primaryBankCard = dataState!;
  }

  Future<ContractEntity> createContractFromRequest(
      LoanRequestEntity request) async {
    await getPrimaryBankCard();
    return ContractEntity(
      id: request.id,
      loanContractRequestId: request.id,
      contractTemplateId: "a8a9304f-068b-4c1e-be2d-d7c14a6e33cd",
      lender: request.receiver,
      borrower: request.sender,
      lenderBankCardId: request.receiverBankCardId ?? primaryBankCard.id,
      borrowerBankCardId: request.senderBankCardId ?? primaryBankCard.id,
      lenderBankCard: request.receiverBankCard ?? primaryBankCard,
      borrowerBankCard: request.senderBankCard ?? primaryBankCard,
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
  Future<void> payContractFee(LoanRequestEntity request) async {
    final value = await _payLoanRequestUsecase.call(params: request.id);
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

  // copy to clipboard
  void copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    Get.snackbar(
      'Đã copy',
      text,
      backgroundColor: AppColors.green,
      colorText: Colors.white,
    );
  }
}
