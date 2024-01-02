import 'package:_88credit_flutter/core/utils/convert_number.dart';
import 'package:_88credit_flutter/features/data/models/credit/bank_card.dart';
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
    super.portaitPhoto,
    super.idCardFrontPhoto,
    super.idCardBackPhoto,
    super.senderBankCardId,
    super.receiverBankCardId,
    super.rejectedReason,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.senderBankCard,
    super.receiverBankCard,
  });

  factory LoanRequestModel.fromJson(Map<String, dynamic> json) {
    return LoanRequestModel(
      id: json['id'],
      status: json['status'] != null
          ? LoanContractRequestStatus.parse(json['status'])
          : null,
      sender: UserEntity.fromJson(json['sender']),
      receiver: UserEntity.fromJson(json['receiver']),
      description: json['description'],
      loanAmount: json['loan_amount'] != null
          ? double.parse(json['loan_amount'])
          : null,
      interestRate: ConverNumber.convertIntToDouble(json['interest_rate']),
      overdueInterestRate:
          ConverNumber.convertIntToDouble(json['overdue_interest_rate']),
      loanTenureMonths: json['loan_tenure_months'],
      loanReasonType: json['loan_reason_type'] != null
          ? LoanReasonTypes.parse(json['loan_reason_type'])
          : null,
      loanReason: json['loan_reason'],
      videoConfirmation: json['video_confirmation'],
      portaitPhoto: json['portait_photo'],
      idCardFrontPhoto: json['id_card_front_photo'],
      idCardBackPhoto: json['id_card_back_photo'],
      senderBankCardId: json['sender_bank_card_id'],
      receiverBankCardId: json['receiver_bank_card_id'],
      rejectedReason: json['rejected_reason'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      senderBankCard: json['sender_bank_card'] != null
          ? BankCardModel.fromJson(json['sender_bank_card'])
          : null,
      receiverBankCard: json['receiver_bank_card'] != null
          ? BankCardModel.fromJson(json['receiver_bank_card'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'receiver_id': receiver!.id,
      'loan_amount': loanAmount,
      'description': description,
      'interest_rate': interestRate,
      'overdue_interest_rate': overdueInterestRate,
      'loan_tenure_months': loanTenureMonths,
      'loan_reason_type': loanReasonType.toString(),
      'loan_reason': loanReason,
      'video_confirmation': videoConfirmation,
      'portait_photo': portaitPhoto,
      'id_card_front_photo': idCardFrontPhoto,
      'id_card_back_photo': idCardBackPhoto,
      "sender_bank_card_id": senderBankCardId,
      'receiver_bank_card_id': receiverBankCardId,
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
      portaitPhoto: entity.portaitPhoto,
      idCardFrontPhoto: entity.idCardFrontPhoto,
      idCardBackPhoto: entity.idCardBackPhoto,
      senderBankCardId: entity.senderBankCardId,
      receiverBankCardId: entity.receiverBankCardId,
      rejectedReason: entity.rejectedReason,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      senderBankCard: entity.senderBankCard,
      receiverBankCard: entity.receiverBankCard,
    );
  }
}
