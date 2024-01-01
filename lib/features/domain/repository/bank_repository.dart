import 'package:_88credit_flutter/features/domain/entities/credit/bank.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/resources/pair.dart';

abstract class BankRepository {
  Future<DataState<Pair<int, List<BankEntity>>>> searchBanks(
      String query, int page);

  Future<DataState<List<BankCardEntity>>> getBankCards();
}
