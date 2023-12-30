import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import '../../../../core/resources/pair.dart';
import '../../../data/models/credit/user.dart';
import '../../repository/user_repository.dart';

class SearchUserUseCase
    implements UseCase<Pair<int, List<UserModel>>, Pair<String, int>> {
  final UserRepository _userRepository;

  SearchUserUseCase(this._userRepository);

  @override
  Future<Pair<int, List<UserModel>>> call({Pair<String, int>? params}) async {
    if (params == null) {
      return Pair(0, []);
    }
    return await _userRepository
        .searchUsers(params.first, params.second)
        .then((value) {
      if (value is DataSuccess) {
        return value.data ?? Pair(0, []);
      } else {
        return Pair(0, []);
      }
    });
  }
}
