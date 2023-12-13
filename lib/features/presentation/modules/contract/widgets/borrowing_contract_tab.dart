import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/contract_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../contract_controler.dart';
import 'base_list_contract.dart';

class BorrowingContractTab extends StatelessWidget {
  BorrowingContractTab({super.key});

  final ContractController controller = Get.find<ContractController>();

  Widget? buildItem(ContractEntity contract) {
    return ContractItem(contract);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BaseListContract(
        titleNull: "Chưa có hợp đồng nào",
        getRequest: controller.getBorrowingContract,
        requestsList: controller.borrowingContracts,
        buildItem: buildItem,
      ),
    );
  }
}
