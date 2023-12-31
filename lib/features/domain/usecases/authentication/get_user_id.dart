import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/authentication_repository.dart';

class GetUserIdUseCase implements UseCase<String?, void> {
  final AuthenticationRepository _authenRepository;
  GetUserIdUseCase(this._authenRepository);

  @override
  Future<String?> call({void params}) async {
    final userId = _authenRepository.getUserId();
    if (userId is DataSuccess) {
      return userId.data!;
    } else {
      return null;
    }
  }
}
