abstract class UseCase<T, Params> {
  Future<T> call({Params params});
}

abstract class UseCaseSync<T, Params> {
  T call({Params params});
}
