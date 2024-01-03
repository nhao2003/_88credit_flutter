import 'package:_88credit_flutter/features/data/models/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/user.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';

import '../../../../core/utils/convert_number.dart';

class ContractModel extends ContractEntity {
  const ContractModel({
    super.id,
    super.loanContractRequestId,
    super.contractTemplateId,
    super.lender,
    super.lenderBankCardId,
    super.borrower,
    super.borrowerBankCardId,
    super.loanReasonType,
    super.loanReason,
    super.amount,
    super.interestRate,
    super.tenureInMonths,
    super.overdueInterestRate,
    super.createdAt,
    super.expiredAt,
    super.lenderBankCard,
    super.borrowerBankCard,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return ContractModel(
      id: json['id'],
      loanContractRequestId: json['loan_contract_request_id'],
      contractTemplateId: json['contract_template_id'],
      lender: UserEntity.fromJson(json['lender']),
      lenderBankCardId: json['lender_bank_card_id'],
      borrower: UserEntity.fromJson(json['borrower']),
      borrowerBankCardId: json['borrower_bank_card_id'],
      loanReasonType: json['loan_reason_type'] != null
          ? LoanReasonTypes.parse(json['loan_reason_type'])
          : null,
      loanReason: json['loan_reason'],
      amount: double.tryParse(json['amount']),
      interestRate: ConverNumber.convertIntToDouble(json['interest_rate']),
      overdueInterestRate:
          ConverNumber.convertIntToDouble(json['overdue_interest_rate']),
      tenureInMonths: json['tenure_in_months'],
      createdAt: DateTime.parse(json['created_at']),
      expiredAt: DateTime.parse(json['expired_at']),
      lenderBankCard: json['lender_bank_card'] != null
          ? BankCardModel.fromJson(json['lender_bank_card'])
          : null,
      borrowerBankCard: json['borrower_bank_card'] != null
          ? BankCardModel.fromJson(json['borrower_bank_card'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'loan_contract_request_id': loanContractRequestId,
      'contract_template_id': contractTemplateId,
      'lender': lender,
      'lender_bank_Card_id': lenderBankCardId,
      'borrower': borrower,
      'borrower_bank_Card_id': borrowerBankCardId,
      'loan_reason_type': loanReasonType,
      'loan_reason': loanReason,
      'amount': amount,
      'interest_rate': interestRate,
      'tenure_in_months': tenureInMonths,
      'overdue_interest_rate': overdueInterestRate,
      'created_at': createdAt,
      'expired_at': expiredAt,
    };
  }

  // from entity
  factory ContractModel.fromEntity(ContractEntity entity) {
    return ContractModel(
      id: entity.id,
      loanContractRequestId: entity.loanContractRequestId,
      contractTemplateId: entity.contractTemplateId,
      lender: entity.lender,
      lenderBankCardId: entity.lenderBankCardId,
      borrower: entity.borrower,
      borrowerBankCardId: entity.borrowerBankCardId,
      loanReasonType: entity.loanReasonType,
      loanReason: entity.loanReason,
      amount: entity.amount,
      interestRate: entity.interestRate,
      tenureInMonths: entity.tenureInMonths,
      overdueInterestRate: entity.overdueInterestRate,
      createdAt: entity.createdAt,
      expiredAt: entity.expiredAt,
      lenderBankCard: entity.lenderBankCard,
      borrowerBankCard: entity.borrowerBankCard,
    );
  }
}
