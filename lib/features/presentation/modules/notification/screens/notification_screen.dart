import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/notification/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationController controller = NotificationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Thông báo"),
      body: const Center(
        child: Text('Notification Screen'),
      ),
    );
  }
}
