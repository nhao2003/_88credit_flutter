import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank.dart';
import 'package:_88credit_flutter/features/domain/repository/bank_repository.dart';
import '../../../../core/resources/pair.dart';

class GetAllbankUseCase
    implements UseCase<Pair<int, List<BankEntity>>, Pair<String, int>> {
  final BankRepository _bankRepository;

  GetAllbankUseCase(this._bankRepository);

  @override
  Future<Pair<int, List<BankEntity>>> call({Pair<String, int>? params}) async {
    if (params == null) {
      return Pair(0, []);
    }
    return await _bankRepository
        .searchBanks(params.first, params.second)
        .then((value) {
      if (value is DataSuccess) {
        return value.data ?? Pair(0, []);
      } else {
        return Pair(0, []);
      }
    });
  }
}
