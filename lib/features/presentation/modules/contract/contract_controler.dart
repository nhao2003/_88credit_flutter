import 'package:_88credit_flutter/core/resources/pair.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';
import 'package:get/get.dart';

import '../../../domain/entities/credit/user.dart';
import '../../../domain/enums/loan_contract_request_status.dart';
import '../../../domain/enums/role.dart';
import '../../../domain/enums/user_status.dart';

class ContractController extends GetxController {
  RxList<LoanRequestEntity> approvedRequests = <LoanRequestEntity>[].obs;
  RxList<LoanRequestEntity> pendingRequests = <LoanRequestEntity>[].obs;
  RxList<LoanRequestEntity> rejectedRequests = <LoanRequestEntity>[].obs;
  RxList<ContractEntity> lendingContracts = <ContractEntity>[].obs;
  RxList<ContractEntity> borrowingContracts = <ContractEntity>[].obs;

  LoanRequestEntity getMockRequest(LoanContractRequestStatus status) {
    return LoanRequestEntity(
      id: "1",
      status: status,
      sender: UserEntity(
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
      receiver: UserEntity(
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
      description: "description",
      loanAmount: 1000000,
      interestRate: 0.1,
      overdueInterestRate: 0.1,
      loanTenureMonths: 12,
      loanReasonType: LoanReasonTypes.business,
      loanReason: "loanReason",
      videoConfirmation: "videoConfirmation",
      portraitPhoto:
          "https://faceinch.vn/upload/news/chup-anh-the-tha-toc-3007.jpg",
      idCardFrontPhoto:
          "https://congan.tiengiang.gov.vn/documents/2261410/29734928/image005.jpg/a25a6795-e346-4d5c-9fc8-ad977f68c258?t=1615901441563",
      idCardBackPhoto:
          "https://ims.baoyenbai.com.vn/NewsImg/3_2023/260633_5-3-mau-the.jpg",
      senderBankAccountId: "senderBankAccountId",
      receiverBankAccountId: "receiverBankAccountId",
      rejectedReason: "rejectedReason",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deletedAt: DateTime.now(),
    );
  }

  Future<Pair<int, List<LoanRequestEntity>>> getRequestsApproved(
      {int? page = 1}) async {
    // final dataState = await _getPostsApprovedUseCase(params: page);
    // if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
    //   return dataState.data!;
    // } else {
    //   return Pair(1, []);
    // }
    return Pair(1, [getMockRequest(LoanContractRequestStatus.cancle)]);
  }

  Future<Pair<int, List<LoanRequestEntity>>> getRequestsPending(
      {int? page = 1}) async {
    // final dataState = await _getPostsApprovedUseCase(params: page);
    // if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
    //   return dataState.data!;
    // } else {
    //   return Pair(1, []);
    // }
    return Pair(1, [getMockRequest(LoanContractRequestStatus.pending)]);
  }

  Future<Pair<int, List<LoanRequestEntity>>> getRequestsRejected(
      {int? page = 1}) async {
    // final dataState = await _getPostsApprovedUseCase(params: page);
    // if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
    //   return dataState.data!;
    // } else {
    //   return Pair(1, []);
    // }
    return Pair(1, [getMockRequest(LoanContractRequestStatus.rejected)]);
  }

  Future<Pair<int, List<ContractEntity>>> getLendingContract(
      {int? page = 1}) async {
    // final dataState = await _getPostsApprovedUseCase(params: page);
    // if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
    //   return dataState.data!;
    // } else {
    //   return Pair(1, []);
    // }
    return Pair(1, []);
  }

  Future<Pair<int, List<ContractEntity>>> getBorrowingContract(
      {int? page = 1}) async {
    // final dataState = await _getPostsApprovedUseCase(params: page);
    // if (dataState is DataSuccess && dataState.data!.second.isNotEmpty) {
    //   return dataState.data!;
    // } else {
    //   return Pair(1, []);
    // }
    return Pair(1, []);
  }
}
