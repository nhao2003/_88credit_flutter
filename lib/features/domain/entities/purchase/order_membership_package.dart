import 'package:equatable/equatable.dart';

class OrderMembershipPackage extends Equatable {
  final String transactionId;
  final String orderUrl;
  final String zpTransToken;
  final String orderToken;
  final String appTransId;

  const OrderMembershipPackage({
    required this.transactionId,
    required this.orderUrl,
    required this.zpTransToken,
    required this.orderToken,
    required this.appTransId,
  });

  @override
  List<Object?> get props => [
        transactionId,
        orderUrl,
        zpTransToken,
        orderToken,
        appTransId,
      ];
}
