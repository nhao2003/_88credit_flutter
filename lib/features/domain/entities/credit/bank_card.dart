import 'package:_88credit_flutter/features/domain/entities/credit/bank.dart';
import 'package:equatable/equatable.dart';

class BankCardEntity extends Equatable {
  final String? id;
  final bool? isPrimary;
  final String? userId;
  final String? bankId;
  final String? cardNumber;
  final String? branch;
  final BankEntity? bank;
  final DateTime? createdAt;
  final DateTime? deletedAt;

  const BankCardEntity({
    this.id,
    this.isPrimary,
    this.userId,
    this.bankId,
    this.bank,
    this.cardNumber,
    this.branch,
    this.createdAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        isPrimary,
        userId,
        bankId,
        bank,
        cardNumber,
        branch,
        createdAt,
        deletedAt,
      ];

  BankCardEntity copyWith({
    String? id,
    bool? isPrimary,
    String? userId,
    String? bankId,
    BankEntity? bank,
    String? cardNumber,
    String? branch,
    DateTime? createdAt,
    DateTime? deletedAt,
  }) {
    return BankCardEntity(
      id: id ?? this.id,
      isPrimary: isPrimary ?? this.isPrimary,
      userId: userId ?? this.userId,
      bankId: bankId ?? this.bankId,
      bank: bank ?? this.bank,
      cardNumber: cardNumber ?? this.cardNumber,
      branch: branch ?? this.branch,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
