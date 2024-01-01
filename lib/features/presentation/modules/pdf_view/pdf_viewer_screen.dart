import 'dart:convert';
import 'package:_88credit_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PdfViewerScreen extends StatelessWidget {
  final String createdDay;

  final String createdMonth;

  final String createdYear;

  final String lenderName;

  final String lenderDob;

  final String lenderIdCardNumber;

  final String lenderIdCardIssuedBy;

  final String lenderIdCardIssuedAt;

  final String lenderPermanentResidence;

  final String lenderPhoneNumber;

  final String lenderBankName;

  final String lenderBankAccountNumber;

  final String lenderBankBranch;

  final String borrowerName;

  final String borrowerDob;

  final String borrowerIdCardNumber;

  final String borrowerIdCardIssuedBy;

  final String borrowerIdCardIssuedAt;

  final String borrowerPermanentResidence;

  final String borrowerPhoneNumber;

  final String borrowerBankName;

  final String borrowerBankAccountNumber;

  final String borrowerBankBranch;

  final String amount;

  final String amountInWords;

  final String loanReason;

  final String tenureInMonths;

  final String createdAt;

  final String expiredAt;

  final String transferDate;

  final String interestRate;

  final String overdueInterestRate;

  const PdfViewerScreen({
    super.key,
    required this.createdDay,
    required this.createdMonth,
    required this.createdYear,
    required this.lenderName,
    required this.lenderDob,
    required this.lenderIdCardNumber,
    required this.lenderIdCardIssuedBy,
    required this.lenderIdCardIssuedAt,
    required this.lenderPermanentResidence,
    required this.lenderPhoneNumber,
    required this.lenderBankName,
    required this.lenderBankAccountNumber,
    required this.lenderBankBranch,
    required this.borrowerName,
    required this.borrowerDob,
    required this.borrowerIdCardNumber,
    required this.borrowerIdCardIssuedBy,
    required this.borrowerIdCardIssuedAt,
    required this.borrowerPermanentResidence,
    required this.borrowerPhoneNumber,
    required this.borrowerBankName,
    required this.borrowerBankAccountNumber,
    required this.borrowerBankBranch,
    required this.amount,
    required this.amountInWords,
    required this.loanReason,
    required this.tenureInMonths,
    required this.createdAt,
    required this.expiredAt,
    required this.transferDate,
    required this.interestRate,
    required this.overdueInterestRate,
  });

  String replaceAll(String content) {
    content = content.replaceAll('{created_day}', createdDay);
    content = content.replaceAll('{created_month}', createdMonth);
    content = content.replaceAll('{created_year}', createdYear);
    content = content.replaceAll('{lender_name}', lenderName);
    content = content.replaceAll('{lender_dob}', lenderDob);
    content = content.replaceAll('{lender_id_card_number}', lenderIdCardNumber);
    content =
        content.replaceAll('{lender_id_card_issued_by}', lenderIdCardIssuedBy);
    content =
        content.replaceAll('{lender_id_card_issued_at}', lenderIdCardIssuedAt);
    content = content.replaceAll(
        '{lender_permanent_residence}', lenderPermanentResidence);
    content = content.replaceAll('{lender_phone_number}', lenderPhoneNumber);
    content = content.replaceAll('{lender_bank_name}', lenderBankName);
    content = content.replaceAll(
        '{lender_bank_account_number}', lenderBankAccountNumber);
    content = content.replaceAll('{lender_bank_branch}', lenderBankBranch);
    content = content.replaceAll('{borrower_name}', borrowerName);
    content = content.replaceAll('{borrower_dob}', borrowerDob);
    content =
        content.replaceAll('{borrower_id_card_number}', borrowerIdCardNumber);
    content = content.replaceAll(
        '{borrower_id_card_issued_by}', borrowerIdCardIssuedBy);
    content = content.replaceAll(
        '{borrower_id_card_issued_at}', borrowerIdCardIssuedAt);
    content = content.replaceAll(
        '{borrower_permanent_residence}', borrowerPermanentResidence);
    content =
        content.replaceAll('{borrower_phone_number}', borrowerPhoneNumber);
    content = content.replaceAll('{borrower_bank_name}', borrowerBankName);
    content = content.replaceAll(
        '{borrower_bank_account_number}', borrowerBankAccountNumber);
    content = content.replaceAll('{borrower_bank_branch}', borrowerBankBranch);
    content = content.replaceAll('{amount}', amount);
    content = content.replaceAll('{amount_in_words}', amountInWords);
    content = content.replaceAll('{loan_reason}', loanReason);
    content = content.replaceAll('{tenure_in_months}', tenureInMonths);
    content = content.replaceAll('{created_at}', createdAt);
    content = content.replaceAll('{expired_at}', expiredAt);
    content = content.replaceAll('{transfer_date}', transferDate);
    content = content.replaceAll('{interest_rate}', interestRate);
    content =
        content.replaceAll('{overdue_interest_rate}', overdueInterestRate);
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
