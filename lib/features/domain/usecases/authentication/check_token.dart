import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/authentication_repository.dart';

class CheckTokenUseCase implements UseCase<DataState<bool>, void> {
  final AuthenticationRepository _authenRepository;

  CheckTokenUseCase(this._authenRepository);

  @override
  Future<DataState<bool>> call({void params}) async {
    final isAccessTokenValid = await _authenRepository.checkActiveToken();

    if (isAccessTokenValid is DataSuccess && isAccessTokenValid.data == true) {
      // access to ken valid
      return const DataSuccess(true);
    } else if (isAccessTokenValid is DataSuccess &&
        isAccessTokenValid.data == false) {
      // access token expired
      final isRefreshTokenValid = await _authenRepository.checkRefreshToken();
      if (isRefreshTokenValid is DataSuccess &&
          isRefreshTokenValid.data == true) {
        // refresh token valid
        await _authenRepository.refreshNewAccessToken();
        return const DataSuccess(true);
      } else {
        return const DataSuccess(false);
      }
    } else {
      return const DataSuccess(false);
    }
  }
}
