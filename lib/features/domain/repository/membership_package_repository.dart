import '../../../../core/resources/data_state.dart';
import '../../data/models/nhagiare/purchase/order_membership_package_model.dart';
import '../entities/nhagiare/purchase/membership_package.dart';

abstract class MembershipPackageRepository {
  Future<DataState<List<MembershipPackageEntity>>> getMembershipPackages();
  Future<DataState<OrderMembershipPackageModel>> createOrder(
      String packageId, int numOfMonth);
}
