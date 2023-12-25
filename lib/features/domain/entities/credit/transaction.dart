import 'package:equatable/equatable.dart';
import '../../enums/payment_methods.dart';
import '../../enums/transaction_status.dart';

class TransactionEntity extends Equatable {
  final String? id;
  final String? idThirdParty;
  final TransactionStatus? status;
  final String? title;
  final String? description;
  final String? userId;
  final int? amount;
  final PaymentMethods? paymentMethod;
  final List<dynamic>? items;
  final Map<String, dynamic>? embedData;
  final DateTime? createdAt;
  final DateTime? transactionAt;

  const TransactionEntity({
    this.id,
    this.idThirdParty,
    this.status,
    this.title,
    this.description,
    this.userId,
    this.amount,
    this.paymentMethod,
    this.items,
    this.embedData,
    this.createdAt,
    this.transactionAt,
  });

  @override
  List<Object?> get props => [
        id,
        idThirdParty,
        status,
        title,
        description,
        userId,
        amount,
        paymentMethod,
        items,
        embedData,
        createdAt,
        transactionAt,
      ];

  TransactionEntity copyWith({
    String? id,
    String? idThirdParty,
    TransactionStatus? status,
    String? title,
    String? description,
    String? userId,
    int? amount,
    PaymentMethods? paymentMethod,
    List<dynamic>? items,
    Map<String, dynamic>? embedData,
    DateTime? createdAt,
    DateTime? transactionAt,
    DateTime? deletedAt,
  }) {
    return TransactionEntity(
      id: id ?? this.id,
      idThirdParty: idThirdParty ?? this.idThirdParty,
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      items: items ?? this.items,
      embedData: embedData ?? this.embedData,
      createdAt: createdAt ?? this.createdAt,
      transactionAt: transactionAt ?? this.transactionAt,
    );
  }
}
