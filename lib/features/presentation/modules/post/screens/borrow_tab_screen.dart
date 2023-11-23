import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/presentation/modules/post/widgets/card_sort.dart';
import '../widgets/post_borrow_card.dart';

class BorrowTabScreen extends StatelessWidget {
  const BorrowTabScreen({super.key});

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
              PostBorrowCard(),
              const SizedBox(height: 20),
              PostBorrowCard(),
              const SizedBox(height: 20),
              PostBorrowCard(),
            ],
          ),
        ),
      ),
    );
  }
}
