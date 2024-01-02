import 'package:_88credit_flutter/features/domain/entities/credit/user.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';
import 'package:equatable/equatable.dart';
import '../../enums/loan_contract_request_status.dart';
import 'bank_card.dart';

class LoanRequestEntity extends Equatable {
  final String? id;
  final LoanContractRequestStatus? status;
  final UserEntity? sender;
  final UserEntity? receiver;
  final String? description;
  final double? loanAmount;
  final double? interestRate;
  final double? overdueInterestRate;
  final int? loanTenureMonths;
  final LoanReasonTypes? loanReasonType;
  final String? loanReason;
  final String? videoConfirmation;
  final String? portaitPhoto;
  final String? idCardFrontPhoto;
  final String? idCardBackPhoto;
  final String? senderBankCardId;
  final BankCardEntity? senderBankCard;
  final String? receiverBankCardId;
  final BankCardEntity? receiverBankCard;
  final String? rejectedReason;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const LoanRequestEntity({
    this.id,
    this.status,
    this.sender,
    this.receiver,
    this.description,
    this.loanAmount,
    this.interestRate,
    this.overdueInterestRate,
    this.loanTenureMonths,
    this.loanReasonType,
    this.loanReason,
    this.videoConfirmation,
    this.portaitPhoto,
    this.idCardFrontPhoto,
    this.idCardBackPhoto,
    this.senderBankCardId,
    this.receiverBankCardId,
    this.rejectedReason,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.senderBankCard,
    this.receiverBankCard,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        sender,
        receiver,
        description,
        loanAmount,
        interestRate,
        overdueInterestRate,
        loanTenureMonths,
        loanReasonType,
        loanReason,
        videoConfirmation,
        portaitPhoto,
        idCardFrontPhoto,
        idCardBackPhoto,
        senderBankCardId,
        receiverBankCardId,
        rejectedReason,
        createdAt,
        updatedAt,
        deletedAt,
        senderBankCard,
        receiverBankCard,
      ];

  LoanRequestEntity copyWith({
    String? id,
    LoanContractRequestStatus? status,
    UserEntity? sender,
    UserEntity? receiver,
    String? description,
    double? loanAmount,
    double? interestRate,
    double? overdueInterestRate,
    int? loanTenureMonths,
    LoanReasonTypes? loanReasonType,
    String? loanReason,
    String? videoConfirmation,
    String? portaitPhoto,
    String? idCardFrontPhoto,
    String? idCardBackPhoto,
    String? senderBankCardId,
    String? receiverBankCardId,
    String? rejectedReason,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    BankCardEntity? senderBankCard,
    BankCardEntity? receiverBankCard,
  }) {
    return LoanRequestEntity(
      id: id ?? this.id,
      status: status ?? this.status,
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      description: description ?? this.description,
      loanAmount: loanAmount ?? this.loanAmount,
      interestRate: interestRate ?? this.interestRate,
      overdueInterestRate: overdueInterestRate ?? this.overdueInterestRate,
      loanTenureMonths: loanTenureMonths ?? this.loanTenureMonths,
      loanReasonType: loanReasonType ?? this.loanReasonType,
      loanReason: loanReason ?? this.loanReason,
      videoConfirmation: videoConfirmation ?? this.videoConfirmation,
      portaitPhoto: portaitPhoto ?? this.portaitPhoto,
      idCardFrontPhoto: idCardFrontPhoto ?? this.idCardFrontPhoto,
      idCardBackPhoto: idCardBackPhoto ?? this.idCardBackPhoto,
      senderBankCardId: senderBankCardId ?? this.senderBankCardId,
      receiverBankCardId: receiverBankCardId ?? this.receiverBankCardId,
      rejectedReason: rejectedReason ?? this.rejectedReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      senderBankCard: senderBankCard ?? this.senderBankCard,
      receiverBankCard: receiverBankCard ?? this.receiverBankCard,
    );
  }
}
