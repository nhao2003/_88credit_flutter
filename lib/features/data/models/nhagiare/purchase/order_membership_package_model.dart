import '../../../../domain/entities/nhagiare/purchase/order_membership_package.dart';

class OrderMembershipPackageModel extends OrderMembershipPackage {
  const OrderMembershipPackageModel({
    required super.transactionId,
    required super.orderUrl,
    required super.zpTransToken,
    required super.orderToken,
    required super.appTransId,
  });

  factory OrderMembershipPackageModel.fromJson(Map<String, dynamic> json) {
    return OrderMembershipPackageModel(
      transactionId: json['transaction_id'],
      orderUrl: json['order_url'],
      zpTransToken: json['zp_trans_token'],
      orderToken: json['order_token'],
      appTransId: json['app_trans_id'],
    );
  }
}
