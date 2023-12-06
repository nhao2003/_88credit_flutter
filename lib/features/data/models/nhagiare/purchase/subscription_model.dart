import '../../../../domain/entities/nhagiare/purchase/subscription.dart';

class SubscriptionModel extends Subscription {
  const SubscriptionModel({
    required super.id,
    required super.userId,
    required super.packageId,
    required super.transactionId,
    required super.startingDate,
    required super.expirationDate,
    required super.isActive,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'],
      userId: json['user_id'],
      packageId: json['package_id'],
      transactionId: json['transaction_id'],
      startingDate: DateTime.tryParse(json['starting_date']) ?? DateTime.now(),
      expirationDate:
          DateTime.tryParse(json['expiration_date']) ?? DateTime.now(),
      isActive: json['is_active'],
    );
  }
}
