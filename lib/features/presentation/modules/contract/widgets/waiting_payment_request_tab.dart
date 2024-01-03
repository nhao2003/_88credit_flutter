import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/base_list_request.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/widgets/request_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/credit/loan_request.dart';
import '../contract_controler.dart';

class WaitingPaymentRequestTab extends StatelessWidget {
  WaitingPaymentRequestTab({super.key});

  final ContractController controller = Get.find<ContractController>();

  Widget? buildItem(LoanRequestEntity request) {
    return RequestItem(request: request);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BaseListRequests(
        titleNull: "Chưa có tin đã đăng",
        getRequest: controller.getRequestsWaitingPayment,
        requestsList: controller.waitingPaymentRequests,
        buildItem: buildItem,
      ),
    );
  }
}
