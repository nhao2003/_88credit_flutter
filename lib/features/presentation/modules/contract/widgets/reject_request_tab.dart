import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/credit/loan_request.dart';
import '../contract_controler.dart';
import 'base_list_request.dart';
import 'request_item.dart';

class RejectRequestTab extends StatelessWidget {
  RejectRequestTab({super.key});

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
        getRequest: controller.getRequestsRejected,
        requestsList: controller.rejectedRequests,
        buildItem: buildItem,
      ),
    );
  }
}
