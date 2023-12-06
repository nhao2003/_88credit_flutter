import 'package:_88credit_flutter/features/domain/entities/credit/bank_account.dart';

class BankAccountModel extends BankAccountEntity {
  const BankAccountModel({
    super.id,
    super.isPrimary,
    super.userId,
    super.bankName,
    super.bankAccount,
    super.branch,
    super.createdAt,
    super.deletedAt,
  });

  factory BankAccountModel.fromJson(Map<String, dynamic> json) {
    return BankAccountModel(
      id: json['id'],
      isPrimary: json['is_primary'],
      userId: json['user_id'],
      bankName: json['bank_name'],
      bankAccount: json['bank_account'],
      branch: json['branch'],
      createdAt: DateTime.parse(json['created_at']),
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_primary': isPrimary,
      'user_id': userId,
      'bank_name': bankName,
      'bank_account': bankAccount,
      'branch': branch,
      'created_at': createdAt,
      'deleted_at': deletedAt,
    };
  }

  // from entity
  factory BankAccountModel.fromEntity(BankAccountEntity entity) {
    return BankAccountModel(
      id: entity.id,
      isPrimary: entity.isPrimary,
      userId: entity.userId,
      bankName: entity.bankName,
      bankAccount: entity.bankAccount,
      branch: entity.branch,
      createdAt: entity.createdAt,
      deletedAt: entity.deletedAt,
    );
  }
}
