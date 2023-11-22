import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/data/models/post/address.dart';
import 'package:_88credit_flutter/features/domain/entities/posts/address.dart';
import 'package:_88credit_flutter/features/domain/repository/provinces_repository.dart';

class GetAddressUseCase
    implements UseCaseSync<DataState<String>, AddressModel> {
  final ProvincesRepository _provincesRepository;

  GetAddressUseCase(this._provincesRepository);

  @override
  DataState<String> call({AddressEntity? params}) {
    return _provincesRepository.getFullAddress(
      params!.detail,
      params.provinceCode!,
      params.districtCode!,
      params.wardCode!,
    );
  }
}
