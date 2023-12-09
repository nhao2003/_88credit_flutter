import 'package:_88credit_flutter/features/domain/entities/credit/user.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';

import '../../../domain/entities/credit/loan_request.dart';
import '../../../domain/enums/loan_contract_request_status.dart';

class LoanRequestModel extends LoanRequestEntity {
  const LoanRequestModel({
    super.id,
    super.status,
    super.sender,
    super.receiver,
    super.description,
    super.loanAmount,
    super.interestRate,
    super.overdueInterestRate,
    super.loanTenureMonths,
    super.loanReasonType,
    super.loanReason,
    super.videoConfirmation,
    super.portraitPhoto,
    super.idCardFrontPhoto,
    super.idCardBackPhoto,
    super.senderBankAccountId,
    super.receiverBankAccountId,
    super.rejectedReason,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  factory LoanRequestModel.fromJson(Map<String, dynamic> json) {
    return LoanRequestModel(
      id: json['id'],
      status: json['status'] != null
          ? LoanContractRequestStatus.parse(json['status'])
          : null,
      sender: UserEntity.fromJson(json['sender_id']),
      receiver: UserEntity.fromJson(json['receiver_id']),
      description: json['description'],
      loanAmount: json['loan_amount'],
      interestRate: json['interest_rate'],
      overdueInterestRate: json['overdue_interest_rate'],
      loanTenureMonths: json['loan_tenure_months'],
      loanReasonType: json['loan_reason_type'] != null
          ? LoanReasonTypes.parse(json['loan_reason_type'])
          : null,
      loanReason: json['loan_reason'],
      videoConfirmation: json['video_confirmation'],
      portraitPhoto: json['portrait_photo'],
      idCardFrontPhoto: json['id_card_front_photo'],
      idCardBackPhoto: json['id_card_back_photo'],
      senderBankAccountId: json['sender_bank_account_id'],
      receiverBankAccountId: json['receiver_bank_account_id'],
      rejectedReason: json['rejected_reason'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'sender_id': sender,
      'receiver_id': receiver,
      'description': description,
      'loan_amount': loanAmount,
      'interest_rate': interestRate,
      'overdue_interest_rate': overdueInterestRate,
      'loan_tenure_months': loanTenureMonths,
      'loan_reason_type': loanReasonType,
      'loan_reason': loanReason,
      'video_confirmation': videoConfirmation,
      'portrait_photo': portraitPhoto,
      'id_card_front_photo': idCardFrontPhoto,
      'id_card_back_photo': idCardBackPhoto,
      'sender_bank_account_id': senderBankAccountId,
      'receiver_bank_account_id': receiverBankAccountId,
      'rejected_reason': rejectedReason,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }

  // from entity
  factory LoanRequestModel.fromEntity(LoanRequestEntity entity) {
    return LoanRequestModel(
      id: entity.id,
      status: entity.status,
      sender: entity.sender,
      receiver: entity.receiver,
      description: entity.description,
      loanAmount: entity.loanAmount,
      interestRate: entity.interestRate,
      overdueInterestRate: entity.overdueInterestRate,
      loanTenureMonths: entity.loanTenureMonths,
      loanReasonType: entity.loanReasonType,
      loanReason: entity.loanReason,
      videoConfirmation: entity.videoConfirmation,
      portraitPhoto: entity.portraitPhoto,
      idCardFrontPhoto: entity.idCardFrontPhoto,
      idCardBackPhoto: entity.idCardBackPhoto,
      senderBankAccountId: entity.senderBankAccountId,
      receiverBankAccountId: entity.receiverBankAccountId,
      rejectedReason: entity.rejectedReason,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
    );
  }
}
