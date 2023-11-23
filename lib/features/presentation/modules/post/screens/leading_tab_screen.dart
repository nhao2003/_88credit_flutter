import 'package:_88credit_flutter/features/presentation/modules/post/widgets/card_sort.dart';
import 'package:_88credit_flutter/features/presentation/modules/post/widgets/post_lending_card.dart';
import 'package:flutter/material.dart';

class LendingTabScreen extends StatelessWidget {
  const LendingTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const CardSort(),
              const SizedBox(height: 20),
              PostLendingCard(),
              const SizedBox(height: 20),
              PostLendingCard(),
              const SizedBox(height: 20),
              PostLendingCard(),
            ],
          ),
        ),
      ),
    );
  }
}
