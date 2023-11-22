import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/authentication_repository.dart';

class CheckActiveTokenUseCase implements UseCase<DataState<bool>, void> {
  final AuthenticationRepository _authenRepository;

  CheckActiveTokenUseCase(this._authenRepository);

  @override
  Future<DataState<bool>> call({void params}) {
    return _authenRepository.checkActiveToken();
  }
}
