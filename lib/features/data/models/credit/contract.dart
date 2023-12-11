import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/user.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';

class ContractModel extends ContractEntity {
  const ContractModel({
    super.id,
    super.loanContractRequestId,
    super.contractTemplateId,
    super.lender,
    super.lenderBankAccountId,
    super.borrower,
    super.borrowerBankAccountId,
    super.loanReasonType,
    super.loanReason,
    super.amount,
    super.interestRate,
    super.tenureInMonths,
    super.overdueInterestRate,
    super.createdAt,
    super.expiredAt,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) {
    return ContractModel(
      id: json['id'],
      loanContractRequestId: json['loan_contract_request_id'],
      contractTemplateId: json['contract_template_id'],
      lender: UserEntity.fromJson(json['lender']),
      lenderBankAccountId: json['lender_bank_account_id'],
      borrower: UserEntity.fromJson(json['borrower']),
      borrowerBankAccountId: json['borrower_bank_account_id'],
      loanReasonType: json['loan_reason_type'] != null
          ? LoanReasonTypes.parse(json['loan_reason_type'])
          : null,
      loanReason: json['loan_reason'],
      amount: json['amount'],
      interestRate: json['interest_rate'],
      tenureInMonths: json['tenure_in_months'],
      overdueInterestRate: json['overdue_interest_rate'],
      createdAt: DateTime.parse(json['created_at']),
      expiredAt: DateTime.parse(json['expired_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'loan_contract_request_id': loanContractRequestId,
      'contract_template_id': contractTemplateId,
      'lender': lender,
      'lender_bank_account_id': lenderBankAccountId,
      'borrower': borrower,
      'borrower_bank_account_id': borrowerBankAccountId,
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
      lenderBankAccountId: entity.lenderBankAccountId,
      borrower: entity.borrower,
      borrowerBankAccountId: entity.borrowerBankAccountId,
      loanReasonType: entity.loanReasonType,
      loanReason: entity.loanReason,
      amount: entity.amount,
      interestRate: entity.interestRate,
      tenureInMonths: entity.tenureInMonths,
      overdueInterestRate: entity.overdueInterestRate,
      createdAt: entity.createdAt,
      expiredAt: entity.expiredAt,
    );
  }
}
