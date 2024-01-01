import 'package:_88credit_flutter/features/data/models/credit/bank.dart';

import '../../../domain/entities/credit/bank_card.dart';

class BankCardModel extends BankCardEntity {
  const BankCardModel({
    super.id,
    super.isPrimary,
    super.userId,
    super.bankId,
    super.bank,
    super.cardNumber,
    super.branch,
    super.createdAt,
    super.deletedAt,
  });

  factory BankCardModel.fromJson(Map<String, dynamic> json) {
    return BankCardModel(
      id: json['id'],
      isPrimary: json['is_primary'],
      userId: json['user_id'],
      bankId: json['bank_id'],
      bank: json['bank'] != null ? BankModel.fromJson(json['bank']) : null,
      cardNumber: json['card_number'],
      branch: json['branch'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bank_id': bank!.id,
      'card_number': cardNumber,
    };
  }

  // from entity
  factory BankCardModel.fromEntity(BankCardEntity entity) {
    return BankCardModel(
      id: entity.id,
      isPrimary: entity.isPrimary,
      userId: entity.userId,
      bankId: entity.bankId,
      bank: entity.bank,
      cardNumber: entity.cardNumber,
      branch: entity.branch,
      createdAt: entity.createdAt,
      deletedAt: entity.deletedAt,
    );
  }
}
