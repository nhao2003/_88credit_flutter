import 'package:_88credit_flutter/core/usecases/usecase.dart';
import 'package:_88credit_flutter/features/domain/repository/bank_repository.dart';

class MarkAsPrimaryBankCardsUseCase implements UseCase<void, String> {
  final BankRepository _bankRepository;

  MarkAsPrimaryBankCardsUseCase(this._bankRepository);

  @override
  Future<void> call({String? params}) async {
    await _bankRepository.markAsPrimaryBankCard(params!);
  }
}
