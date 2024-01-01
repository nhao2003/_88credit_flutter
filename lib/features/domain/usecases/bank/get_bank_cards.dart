import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/repository/bank_repository.dart';

class GetBankCardsUseCase implements UseCase<List<BankCardEntity>, void> {
  final BankRepository _bankRepository;

  GetBankCardsUseCase(this._bankRepository);

  @override
  Future<List<BankCardEntity>> call({void params}) async {
    return await _bankRepository.getBankCards().then((value) {
      if (value is DataSuccess) {
        return value.data ?? [];
      } else {
        return [];
      }
    });
  }
}
