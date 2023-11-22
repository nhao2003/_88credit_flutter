import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/authentication_repository.dart';
import 'package:_88credit_flutter/features/domain/repository/conversation_repository.dart';

class SignUpUseCase
    implements UseCase<DataState<String>, Map<String, dynamic>?> {
  final AuthenticationRepository _authenRepository;
  final ConversationRepository _conversationRepository;

  SignUpUseCase(this._authenRepository, this._conversationRepository);

  @override
  Future<DataState<String>> call({Map<String, dynamic>? params}) async {
    final data = await _authenRepository.signUp(
        params!['email'], params['password'], params['confirmPassword']);
    if (data is DataSuccess) {
      _conversationRepository.connect();
    }
    return data;
  }
}
