import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/provinces_repository.dart';

class GetProvinceNamesUseCase
    implements UseCaseSync<DataState<List<String>>, void> {
  final ProvincesRepository _provincesRepository;

  GetProvinceNamesUseCase(this._provincesRepository);

  @override
  DataState<List<String>> call({void params}) {
    return _provincesRepository.getProvinceNames();
  }
}
