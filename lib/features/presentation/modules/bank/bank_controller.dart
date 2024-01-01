import 'package:_88credit_flutter/features/domain/entities/credit/bank.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/get_bank_cards.dart';
import 'package:_88credit_flutter/injection_container.dart';
import 'package:get/get.dart';
import '../../../../core/resources/pair.dart';
import '../../../domain/usecases/bank/get_all_banks.dart';

class BankController extends GetxController {
  // bank list
  final GetAllbankUseCase getAllbankUseCase = sl<GetAllbankUseCase>();

  Future<Pair<int, List<BankEntity>>> searchBank(String value, int page) async {
    final dataState = await getAllbankUseCase(params: Pair(value, page));
    return dataState;
  }

  // bank list
  final GetBankCardsUseCase getBankCardsUseCase = sl<GetBankCardsUseCase>();

  Future<List<BankCardEntity>> getBankCards() async {
    final dataState = await getBankCardsUseCase();
    return dataState;
  }
}
