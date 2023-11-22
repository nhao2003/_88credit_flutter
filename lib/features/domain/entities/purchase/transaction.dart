import 'package:equatable/equatable.dart';
import 'package:_88credit_flutter/features/domain/entities/purchase/membership_package.dart';
import 'package:_88credit_flutter/features/domain/entities/purchase/subscription.dart';
import 'package:_88credit_flutter/features/domain/entities/user/user.dart';

class TransactionEntity extends Equatable {
  final String id;
  final String userId;
  final String? discountId;
  final String packageId;
  final int numOfSubscriptionMonth;
  final String appTransId;
  final String status;
  final DateTime timestamp;
  final int amount;
  final String platform;
  final bool isActive;
  final UserEntity? user;
  final Subscription? subscription;
  final MembershipPackageEntity? package;

  bool get isPaid => status == 'success';

  const TransactionEntity({
    required this.id,
    required this.userId,
    required this.discountId,
    required this.packageId,
    required this.numOfSubscriptionMonth,
    required this.appTransId,
    required this.status,
    required this.timestamp,
    required this.amount,
    required this.platform,
    required this.isActive,
    this.user,
    this.subscription,
    this.package,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        discountId,
        packageId,
        numOfSubscriptionMonth,
        appTransId,
        status,
        timestamp,
        amount,
        platform,
        isActive,
        user,
        subscription,
      ];

  // Dummy data
  static List<TransactionEntity> get dummyData => [
        TransactionEntity(
          id: '1',
          userId: '1',
          discountId: '1',
          packageId: '1',
          numOfSubscriptionMonth: 1,
          appTransId: '1',
          status: 'success',
          timestamp: DateTime.now(),
          amount: 100000,
          platform: 'zalopay',
          isActive: true,
          subscription: Subscription(
            id: '1',
            userId: '1',
            packageId: '1',
            transactionId: '1',
            startingDate: DateTime.now(),
            expirationDate: DateTime.now().add(const Duration(days: 30)),
            isActive: true,
          ),
        ),
        TransactionEntity(
          id: '2',
          userId: '1',
          discountId: '1',
          packageId: '1',
          numOfSubscriptionMonth: 1,
          appTransId: '1',
          status: 'success',
          timestamp: DateTime.now(),
          amount: 100000,
          platform: 'zalopay',
          isActive: true,
          subscription: Subscription(
            id: '1',
            userId: '1',
            packageId: '1',
            transactionId: '1',
            startingDate: DateTime.now(),
            expirationDate: DateTime.now().add(const Duration(days: 30)),
            isActive: true,
          ),
        ),
        TransactionEntity(
          id: '3',
          userId: '1',
          discountId: '1',
          packageId: '1',
          numOfSubscriptionMonth: 1,
          appTransId: '1',
          status: 'success',
          timestamp: DateTime.now(),
          amount: 100000,
          platform: 'zalopay',
          isActive: true,
          subscription: Subscription(
            id: '1',
            userId: '1',
            packageId: '1',
            transactionId: '1',
            startingDate: DateTime.now(),
            expirationDate: DateTime.now().add(const Duration(days: 30)),
            isActive: true,
          ),
        ),
      ];
}
