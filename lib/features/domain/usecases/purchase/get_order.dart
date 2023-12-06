import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/membership_package_repository.dart';
import '../../entities/nhagiare/purchase/order_membership_package.dart';

class GetOrderMembershipPackageUseCase
    implements
        UseCase<DataState<OrderMembershipPackage>, Map<String, dynamic>> {
  final MembershipPackageRepository _membershipPackageRepository;

  GetOrderMembershipPackageUseCase(this._membershipPackageRepository);

  @override
  Future<DataState<OrderMembershipPackage>> call(
      {Map<String, dynamic>? params}) {
    return _membershipPackageRepository.createOrder(
        params!['package_id'], params['num_of_month']);
  }
}
