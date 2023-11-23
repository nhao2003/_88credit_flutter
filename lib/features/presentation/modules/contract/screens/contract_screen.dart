import 'package:flutter/material.dart';
import '../../../global_widgets/my_tab_appbar.dart';
import '../contract_controler.dart';

class ContractScreen extends StatelessWidget {
  ContractScreen({super.key});

  final ContractController controller = ContractController();

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MyTabAppbar(
          title: "Hợp đồng",
          tabTitle1: "Yêu cầu",
          tabTitle2: "Hợp đồng",
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Scaffold(),
            Scaffold(),
          ],
        ),
      ),
    );
  }
}
