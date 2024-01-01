import 'package:_88credit_flutter/features/domain/entities/credit/bank.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/get_bank_cards.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/mark_as_primary_bank_card.dart';
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

  // bank card list
  RxBool isLoading = false.obs;
  List<BankCardEntity> listBankCards = <BankCardEntity>[].obs;
  final GetBankCardsUseCase getBankCardsUseCase = sl<GetBankCardsUseCase>();

  Future<List<BankCardEntity>> getBankCards() async {
    isLoading.value = true;
    final dataState = await getBankCardsUseCase();
    listBankCards = [...dataState];
    isLoading.value = false;
    return dataState;
  }

  MarkAsPrimaryBankCardsUseCase markAsPrimaryBankCardsUseCase =
      sl<MarkAsPrimaryBankCardsUseCase>();
  Future<void> setPrimaryCard(String idCard) async {
    isLoading.value = true;
    await markAsPrimaryBankCardsUseCase(params: idCard);
    listBankCards = [...await getBankCardsUseCase()];
    isLoading.value = false;
  }
}
