import 'package:_88credit_flutter/features/data/models/purchase/order_membership_package_model.dart';
import 'package:_88credit_flutter/features/domain/entities/purchase/membership_package.dart';

import '../../../../core/resources/data_state.dart';

abstract class MembershipPackageRepository {
  Future<DataState<List<MembershipPackageEntity>>> getMembershipPackages();
  Future<DataState<OrderMembershipPackageModel>> createOrder(
      String packageId, int numOfMonth);
}
