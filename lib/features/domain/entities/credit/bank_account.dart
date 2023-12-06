import 'package:equatable/equatable.dart';

class BankAccountEntity extends Equatable {
  final String? id;
  final bool? isPrimary;
  final String? userId;
  final String? bankName;
  final String? bankAccount;
  final String? branch;
  final DateTime? createdAt;
  final DateTime? deletedAt;

  const BankAccountEntity({
    this.id,
    this.isPrimary,
    this.userId,
    this.bankName,
    this.bankAccount,
    this.branch,
    this.createdAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        isPrimary,
        userId,
        bankName,
        bankAccount,
        branch,
        createdAt,
        deletedAt,
      ];

  BankAccountEntity copyWith({
    String? id,
    bool? isPrimary,
    String? userId,
    String? bankName,
    String? bankAccount,
    String? branch,
    DateTime? createdAt,
    DateTime? deletedAt,
  }) {
    return BankAccountEntity(
      id: id ?? this.id,
      isPrimary: isPrimary ?? this.isPrimary,
      userId: userId ?? this.userId,
      bankName: bankName ?? this.bankName,
      bankAccount: bankAccount ?? this.bankAccount,
      branch: branch ?? this.branch,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
