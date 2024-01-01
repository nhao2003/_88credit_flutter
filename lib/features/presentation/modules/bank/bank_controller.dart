import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/core/resources/data_state.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/add_bank_card.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/get_bank_cards.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/mark_as_primary_bank_card.dart';
import 'package:_88credit_flutter/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../core/resources/pair.dart';
import '../../../domain/usecases/bank/delete_bank_card.dart';
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
  RxList<BankCardEntity> listBankCards = <BankCardEntity>[].obs;
  final GetBankCardsUseCase getBankCardsUseCase = sl<GetBankCardsUseCase>();

  Future<List<BankCardEntity>> getBankCards() async {
    isLoading.value = true;
    final dataState = await getBankCardsUseCase();
    listBankCards.value = [...dataState];
    isLoading.value = false;
    return dataState;
  }

  MarkAsPrimaryBankCardsUseCase markAsPrimaryBankCardsUseCase =
      sl<MarkAsPrimaryBankCardsUseCase>();
  Future<void> setPrimaryCard(String idCard) async {
    EasyLoading.show(status: 'loading...');
    await markAsPrimaryBankCardsUseCase(params: idCard);
    listBankCards.value = [...await getBankCardsUseCase()];
    EasyLoading.dismiss();
  }

  void navigateToAddBankCard() async {
    Get.toNamed(AppRoutes.bankList)!.then((value) => getBankCards());
  }

  // add bank Card
  RxBool isLoadingAddBankCard = false.obs;
  final formKey = GlobalKey<FormState>();

  BankEntity? selectedBank;
  final TextEditingController cardNumberController = TextEditingController();
  String cardNumber = "";

  AddBankCardUseCase addBankCardUseCase = sl<AddBankCardUseCase>();
  Future<void> addBankCard() async {
    isLoadingAddBankCard.value = true;
    // validate number card
    if (!formKey.currentState!.validate()) {
      isLoadingAddBankCard.value = false;
      return;
    }
    // call api
    final datastate = await addBankCardUseCase(params: createBankCardEntity());
    if (datastate is DataSuccess) {
      isLoadingAddBankCard.value = false;
      // back
      Get.back();
      Get.back();
    } else {
      isLoadingAddBankCard.value = false;
    }
  }

  BankCardEntity createBankCardEntity() {
    return BankCardEntity(
      bank: selectedBank,
      bankId: selectedBank!.id,
      cardNumber: cardNumber,
      isPrimary: false,
    );
  }

  // delete bank card
  DeleteBankCardUseCase deleteBankCardUseCase = sl<DeleteBankCardUseCase>();
  Future<void> deleteBankCard(BankCardEntity card) async {
    EasyLoading.show(status: 'Đang cập nhập');
    await deleteBankCardUseCase(params: card);
    listBankCards.value = [...await getBankCardsUseCase()];
    EasyLoading.dismiss();
  }
}
