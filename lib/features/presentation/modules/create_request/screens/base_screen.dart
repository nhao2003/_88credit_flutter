import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import '../base_controler.dart';

class CreateRequestScreen extends StatelessWidget {
  CreateRequestScreen({super.key});

  final CreateRequestController controller = CreateRequestController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "CreateRequest Screen"),
      body: const Center(
        child: Text('CreateRequest Screen'),
      ),
    );
  }
}
