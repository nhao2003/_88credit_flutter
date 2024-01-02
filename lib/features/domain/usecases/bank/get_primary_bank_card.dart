import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/repository/bank_repository.dart';

class GetPrimaryBankCardUseCase implements UseCase<BankCardEntity?, void> {
  final BankRepository _bankRepository;

  GetPrimaryBankCardUseCase(this._bankRepository);

  @override
  Future<BankCardEntity?> call({void params}) async {
    return await _bankRepository.getPrimaryBankCard().then((value) {
      if (value is DataSuccess) {
        return value.data!;
      } else {
        return null;
      }
    });
  }
}
