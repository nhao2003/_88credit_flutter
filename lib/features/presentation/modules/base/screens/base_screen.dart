import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/base/base_controler.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final BaseController controller = BaseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Base Screen"),
      body: const Center(
        child: Text('Base Screen'),
      ),
    );
  }
}
