import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/authentication_repository.dart';

class SignOutUseCase implements UseCase<DataState<void>, void> {
  final AuthenticationRepository _authenRepository;

  SignOutUseCase(this._authenRepository);

  @override
  Future<DataState<void>> call({void params}) {
    return _authenRepository.signOut();
  }
}
