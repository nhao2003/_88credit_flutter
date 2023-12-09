import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import 'package:_88credit_flutter/features/presentation/modules/contract/contract_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestDetailScreen extends StatelessWidget {
  RequestDetailScreen({super.key});

  final ContractController controller = Get.find<ContractController>();

  final LoanRequestEntity post = Get.arguments as LoanRequestEntity;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("RequestDetailScreen"),
      ),
    );
  }
}
