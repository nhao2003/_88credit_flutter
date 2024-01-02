import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/user.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';
import 'package:equatable/equatable.dart';

class ContractEntity extends Equatable {
  final String? id;
  final String? loanContractRequestId;
  final String? contractTemplateId;
  final UserEntity? lender;
  final String? lenderBankCardId;
  final BankCardEntity? lenderBankCard;
  final UserEntity? borrower;
  final String? borrowerBankCardId;
  final BankCardEntity? borrowerBankCard;
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
    this.lenderBankCardId,
    this.borrower,
    this.borrowerBankCardId,
    this.loanReasonType,
    this.loanReason,
    this.amount,
    this.interestRate,
    this.tenureInMonths,
    this.overdueInterestRate,
    this.createdAt,
    this.expiredAt,
    this.lenderBankCard,
    this.borrowerBankCard,
  });

  @override
  List<Object?> get props => [
        id,
        loanContractRequestId,
        contractTemplateId,
        lender,
        lenderBankCardId,
        borrower,
        borrowerBankCardId,
        loanReasonType,
        loanReason,
        amount,
        interestRate,
        tenureInMonths,
        overdueInterestRate,
        createdAt,
        expiredAt,
        lenderBankCard,
        borrowerBankCard,
      ];

  ContractEntity copyWith({
    String? id,
    String? loanContractRequestId,
    String? contractTemplateId,
    UserEntity? lender,
    String? lenderBankCardId,
    UserEntity? borrower,
    String? borrowerBankCardId,
    LoanReasonTypes? loanReasonType,
    String? loanReason,
    double? amount,
    double? interestRate,
    int? tenureInMonths,
    double? overdueInterestRate,
    DateTime? createdAt,
    DateTime? expiredAt,
    BankCardEntity? lenderBankCard,
    BankCardEntity? borrowerBankCard,
  }) {
    return ContractEntity(
      id: id ?? this.id,
      loanContractRequestId:
          loanContractRequestId ?? this.loanContractRequestId,
      contractTemplateId: contractTemplateId ?? this.contractTemplateId,
      lender: lender ?? this.lender,
      lenderBankCardId: lenderBankCardId ?? this.lenderBankCardId,
      borrower: borrower ?? this.borrower,
      borrowerBankCardId: borrowerBankCardId ?? this.borrowerBankCardId,
      loanReasonType: loanReasonType ?? this.loanReasonType,
      loanReason: loanReason ?? this.loanReason,
      amount: amount ?? this.amount,
      interestRate: interestRate ?? this.interestRate,
      tenureInMonths: tenureInMonths ?? this.tenureInMonths,
      overdueInterestRate: overdueInterestRate ?? this.overdueInterestRate,
      createdAt: createdAt ?? this.createdAt,
      expiredAt: expiredAt ?? this.expiredAt,
      lenderBankCard: lenderBankCard ?? this.lenderBankCard,
      borrowerBankCard: borrowerBankCard ?? this.borrowerBankCard,
    );
  }
}
