import '../../../../core/resources/data_state.dart';
import '../../data/models/credit/user.dart';

abstract class AuthenticationRepository {
  bool get isLoggedIn;
  set isLoggedIn(bool value);

  // API remote
  Future<DataState<void>> signIn(String email, String password);
  Future<DataState<void>> signInWithToken();
  Future<DataState<void>> signOut();
  Future<DataState<String>> signUp(
      String email, String password, String confirmPassword);

  // Local
  DataState<String> getAccessToken();
  DataState<bool> checkActiveToken();
  DataState<bool> checkRefreshTokenIsValid();
  Future<DataState<void>> refreshNewAccessToken();
  DataState<String> getUserId();

  void addAuthStateListener(Function(bool) listener);
  void removeAuthStateListener(Function(bool) listener);
  void notifyAuthStateListeners();

  Future<DataState<UserModel>> getMe();
}
