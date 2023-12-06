import 'package:equatable/equatable.dart';

class Subscription extends Equatable {
  final String id;
  final String userId;
  final String packageId;
  final String transactionId;
  final DateTime startingDate;
  final DateTime expirationDate;
  final bool isActive;

  const Subscription({
    required this.id,
    required this.userId,
    required this.packageId,
    required this.transactionId,
    required this.startingDate,
    required this.expirationDate,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        packageId,
        transactionId,
        startingDate,
        expirationDate,
        isActive,
      ];
}
