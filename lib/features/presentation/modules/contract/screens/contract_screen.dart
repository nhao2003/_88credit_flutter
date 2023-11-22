import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import '../contract_controler.dart';

class ContractScreen extends StatelessWidget {
  ContractScreen({super.key});

  final ContractController controller = ContractController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: "Hợp đồng",
        isShowBack: false,
      ),
      body: const Center(
        child: Text('Contract Screen'),
      ),
    );
  }
}
