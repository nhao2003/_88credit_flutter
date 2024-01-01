import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/repository/bank_repository.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecases/usecase.dart';

class AddBankCardUseCase implements UseCase<DataState<void>, BankCardEntity> {
  final BankRepository _bankRepository;

  AddBankCardUseCase(this._bankRepository);

  @override
  Future<DataState<void>> call({BankCardEntity? params}) {
    return _bankRepository.addBankCard(params!);
  }
}
