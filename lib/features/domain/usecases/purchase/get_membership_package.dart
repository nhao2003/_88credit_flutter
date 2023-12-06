import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/membership_package_repository.dart';
import '../../entities/nhagiare/purchase/membership_package.dart';

class GetMembershipPackageUseCase
    implements UseCase<DataState<List<MembershipPackageEntity>>, void> {
  final MembershipPackageRepository _membershipPackageRepository;

  GetMembershipPackageUseCase(this._membershipPackageRepository);

  @override
  Future<DataState<List<MembershipPackageEntity>>> call({void params}) {
    return _membershipPackageRepository.getMembershipPackages();
  }
}
