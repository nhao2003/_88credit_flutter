import 'package:equatable/equatable.dart';

class ContractEntity extends Equatable {
  final String? id;
  final String? loanContractRequestId;
  final String? contractTemplateId;
  final String? lenderId;
  final String? lenderBankAccountId;
  final String? borrowerId;
  final String? borrowerBankAccountId;
  final String? loanReasonType;
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
    this.lenderId,
    this.lenderBankAccountId,
    this.borrowerId,
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
        lenderId,
        lenderBankAccountId,
        borrowerId,
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
    String? lenderId,
    String? lenderBankAccountId,
    String? borrowerId,
    String? borrowerBankAccountId,
    String? loanReasonType,
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
      lenderId: lenderId ?? this.lenderId,
      lenderBankAccountId: lenderBankAccountId ?? this.lenderBankAccountId,
      borrowerId: borrowerId ?? this.borrowerId,
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
