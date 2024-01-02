import 'package:_88credit_flutter/features/data/models/credit/user.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/user.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/resources/pair.dart';

abstract class UserRepository {
  Future<DataState<Pair<int, List<UserModel>>>> searchUsers(
      String query, int page);
  Future<DataState<UserEntity>> getProfile();
}
