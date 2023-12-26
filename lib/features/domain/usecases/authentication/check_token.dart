import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/authentication_repository.dart';

class CheckTokenUseCase implements UseCase<DataState<bool>, void> {
  final AuthenticationRepository _authenRepository;

  // final ConversationRepository _conversationRepository;
  CheckTokenUseCase(this._authenRepository);

  @override
  Future<DataState<bool>> call({void params}) async {
    final result = await _authenRepository.refreshNewAccessToken();
    if (result is DataSuccess) {
      // _conversationRepository.connect();
      return const DataSuccess(true);
    }
    return const DataSuccess(false);
  }
}
