import 'package:_88credit_flutter/features/domain/entities/credit/user.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';
import 'package:equatable/equatable.dart';

class ContractEntity extends Equatable {
  final String? id;
  final String? loanContractRequestId;
  final String? contractTemplateId;
  final UserEntity? lender;
  final String? lenderBankAccountId;
  final UserEntity? borrower;
  final String? borrowerBankAccountId;
  final LoanReasonTypes? loanReasonType;
  final String? loanReason;
  final double? amount;
  final double? interestRate;
  final int? tenureInMonths;
  final double? overdueInterestRate;
  final DateTime? createdAt;
  final DateTime? expiredAt;

  const ContractEntity({
    this.id,
    this.loanContractRequestId,
    this.contractTemplateId,
    this.lender,
    this.lenderBankAccountId,
    this.borrower,
    this.borrowerBankAccountId,
    this.loanReasonType,
    this.loanReason,
    this.amount,
    this.interestRate,
    this.tenureInMonths,
    this.overdueInterestRate,
    this.createdAt,
    this.expiredAt,
  });

  @override
  List<Object?> get props => [
        id,
        loanContractRequestId,
        contractTemplateId,
        lender,
        lenderBankAccountId,
        borrower,
        borrowerBankAccountId,
        loanReasonType,
        loanReason,
        amount,
        interestRate,
        tenureInMonths,
        overdueInterestRate,
        createdAt,
        expiredAt,
      ];

  ContractEntity copyWith({
    String? id,
    String? loanContractRequestId,
    String? contractTemplateId,
    UserEntity? lender,
    String? lenderBankAccountId,
    UserEntity? borrower,
    String? borrowerBankAccountId,
    LoanReasonTypes? loanReasonType,
    String? loanReason,
    double? amount,
    double? interestRate,
    int? tenureInMonths,
    double? overdueInterestRate,
    DateTime? createdAt,
    DateTime? expiredAt,
  }) {
    return ContractEntity(
      id: id ?? this.id,
      loanContractRequestId:
          loanContractRequestId ?? this.loanContractRequestId,
      contractTemplateId: contractTemplateId ?? this.contractTemplateId,
      lender: lender ?? this.lender,
      lenderBankAccountId: lenderBankAccountId ?? this.lenderBankAccountId,
      borrower: borrower ?? this.borrower,
      borrowerBankAccountId:
          borrowerBankAccountId ?? this.borrowerBankAccountId,
      loanReasonType: loanReasonType ?? this.loanReasonType,
      loanReason: loanReason ?? this.loanReason,
      amount: amount ?? this.amount,
      interestRate: interestRate ?? this.interestRate,
      tenureInMonths: tenureInMonths ?? this.tenureInMonths,
      overdueInterestRate: overdueInterestRate ?? this.overdueInterestRate,
      createdAt: createdAt ?? this.createdAt,
      expiredAt: expiredAt ?? this.expiredAt,
    );
  }
}
