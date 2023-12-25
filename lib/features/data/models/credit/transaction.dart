import 'package:_88credit_flutter/features/domain/entities/credit/transaction.dart';
import 'package:_88credit_flutter/features/domain/enums/payment_methods.dart';
import 'package:_88credit_flutter/features/domain/enums/transaction_status.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    super.id,
    super.idThirdParty,
    super.status,
    super.title,
    super.description,
    super.userId,
    super.amount,
    super.paymentMethod,
    super.items,
    super.embedData,
    super.createdAt,
    super.transactionAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      idThirdParty: json['id_third_party'],
      status: TransactionStatus.fromString(json['status']),
      title: json['title'],
      description: json['description'],
      userId: json['user_id'],
      amount: int.tryParse(json['amount'].toString()),
      paymentMethod: PaymentMethods.fromString(json['payment_method']),
      items: json['items'],
      embedData: json['embed_data'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ""),
      transactionAt: DateTime.tryParse(json['transaction_at'] ?? ""),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_third_party': idThirdParty,
      'status': status,
      'title': title,
      'description': description,
      'user_id': userId,
      'amount': amount,
      'payment_method': paymentMethod,
      'items': items,
      'embed_data': embedData,
      'created_at': createdAt,
      'transaction_at': transactionAt,
    };
  }

  // from entity
  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      idThirdParty: entity.idThirdParty,
      status: entity.status,
      title: entity.title,
      description: entity.description,
      userId: entity.userId,
      amount: entity.amount,
      paymentMethod: entity.paymentMethod,
      items: entity.items,
      embedData: entity.embedData,
      createdAt: entity.createdAt,
      transactionAt: entity.transactionAt,
    );
  }
}
