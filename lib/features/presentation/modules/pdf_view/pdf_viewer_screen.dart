import 'dart:convert';
import 'package:_88credit_flutter/core/constants/constants.dart';
import 'package:_88credit_flutter/core/extensions/date_ex.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class PdfViewerScreen extends StatelessWidget {
  const PdfViewerScreen({
    super.key,
    required this.contract,
  });

  final ContractEntity contract;

  String replaceAll(String content) {
    content =
        content.replaceAll('{created_day}', contract.createdAt!.day.toString());
    content = content.replaceAll(
        '{created_month}', contract.createdAt!.month.toString());
    content = content.replaceAll(
        '{created_year}', contract.createdAt!.year.toString());
    content = content.replaceAll('{lender_name}', contract.lender!.fullName);
    content = content.replaceAll('{lender_dob}', contract.lender!.dob!);
    content = content.replaceAll(
        '{lender_id_card_number}', contract.lenderBankCard!.cardNumber!);
    content =
        content.replaceAll('{lender_id_card_issued_by}', 'Ủy ban nhân dân');
    content = content.replaceAll('{lender_id_card_issued_at}', '01/01/2020');
    content = content.replaceAll('{lender_permanent_residence}',
        contract.lender!.address!.getDetailAddress());
    content =
        content.replaceAll('{lender_phone_number}', contract.lender!.phone!);
    content = content.replaceAll(
        '{lender_bank_name}', contract.lenderBankCard!.bank!.name);
    content = content.replaceAll(
        '{lender_bank_account_number}', contract.lenderBankCard!.cardNumber!);
    content = content.replaceAll('{lender_bank_branch}',
        contract.lenderBankCard!.branch ?? "Hồ Chí Minh");
    content =
        content.replaceAll('{borrower_name}', contract.borrower!.fullName);
    content = content.replaceAll('{borrower_dob}', contract.borrower!.dob!);
    content = content.replaceAll(
        '{borrower_id_card_number}', contract.borrowerBankCard!.cardNumber!);
    content =
        content.replaceAll('{borrower_id_card_issued_by}', 'Ủy ban nhân dân');
    content = content.replaceAll('{borrower_id_card_issued_at}', '01/01/2020');
    content = content.replaceAll('{borrower_permanent_residence}',
        contract.borrower!.address!.getDetailAddress());
    content = content.replaceAll(
        '{borrower_phone_number}', contract.borrower!.phone!);
    content = content.replaceAll(
        '{borrower_bank_name}', contract.borrowerBankCard!.bank!.name);
    content = content.replaceAll('{borrower_bank_account_number}',
        contract.borrowerBankCard!.cardNumber!);
    content = content.replaceAll('{borrower_bank_branch}',
        contract.borrowerBankCard!.branch ?? "Hồ Chí Minh");
    content =
        content.replaceAll('{amount}', contract.amount!.toInt().toString());
    content = content.replaceAll(
        '{amount_in_words}', contract.amount!.toInt().convertNumberToWords());
    content = content.replaceAll('{loan_reason}', contract.loanReason!);
    content = content.replaceAll(
        '{tenure_in_months}', contract.tenureInMonths!.toString());
    content =
        content.replaceAll('{created_at}', contract.createdAt!.toDMYString());
    content =
        content.replaceAll('{expired_at}', contract.expiredAt!.toDMYString());
    content = content.replaceAll(
        '{transfer_date}', contract.createdAt!.toDMYString());
    content = content.replaceAll(
        '{interest_rate}', contract.interestRate!.toString());
    content = content.replaceAll(
        '{overdue_interest_rate}', contract.overdueInterestRate!.toString());
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PDF Viewer'),
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () async {
                // final path = await saveDocument(name: 'test.pdf', pdf: pdf);
                // Share.shareFiles([path]);
              },
            ),
            IconButton(
              icon: const Icon(Icons.download_rounded),
              onPressed: () async {
                // final path = await saveDocument(name: 'test.pdf', pdf: pdf);
                const path = '/storage/emulated/0/Download/test.pdf';
                Get.snackbar('Download', 'Downloaded to $path');
              },
            ),
          ],
        ),
        body: FutureBuilder<String>(
          future: Future<String>(() async {
            // return http
            //     .get(Uri.parse(
            //         apiUrl + '/contract-templates'))
            //     .then((value) => value.body['result']?.first['content']);
            try {
              final res =
                  await http.get(Uri.parse('$apiUrl/contract-template'));
              Map<String, dynamic> body = jsonDecode(res.body);
              final result = body['result'];
              return result.first['content'];
            } catch (e) {
              return '';
            }
          }),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
                child: Html(data: replaceAll(snapshot.data!)));
          },
        ));
  }
}
