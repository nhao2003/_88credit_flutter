import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/entities/credit/user.dart';
import '../../../domain/enums/loan_reason_types.dart';
import '../../../domain/enums/role.dart';
import '../../../domain/enums/user_status.dart';

class CreateRequestController extends GetxController {
  RxBool isLoading = false.obs;
  toggleIsLoading(bool value) {
    isLoading.value = value;
  }

  // vaule
  final sender = UserEntity(
    id: "fec2579d-fe55-4da6-874a-dd5bab669cf8",
    status: UserStatus.notUpdate,
    isIdentityVerified: false,
    role: Role.user,
    email: "nhao@qa.team",
    address: null,
    firstName: "Minh",
    lastName: "Phan",
    gender: false,
    avatar: "https://picsum.photos/200/300?random=4",
    dob: null,
    phone: "123456789",
    lastActiveAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
    createdAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
    updatedAt: null,
    bannedUtil: null,
    banReason: null,
  );
  final loanAmountTextController = TextEditingController();
  double? loanAmount;
  final interestRateTextController = TextEditingController();
  double? interestRate;
  final overdueInterestRateTextController = TextEditingController();
  double? overdueInterestRate;
  final tenureMonthsTextController = TextEditingController();
  int? tenureMonths;
  final Rxn<LoanReasonTypes> loanReasonType = Rxn(null);
  void setLoanReason(LoanReasonTypes value) {
    loanReasonType.value = value;
  }

  final loanReasonTextController = TextEditingController();
  String? loanReason;

  final discriptionTextController = TextEditingController();
  String? discription;

  // create Post
  Future<void> createPost() async {
    toggleIsLoading(true);
    Future.delayed(const Duration(seconds: 2), () {
      toggleIsLoading(false);
      Get.back();
    });
  }

  List<String> timeTypes = ["Tháng", "Năm"];
  RxString timeValue = 'Tháng'.obs;
  void setTimeValue(String? value) {
    timeValue.value = value!;
  }

  // hinh anh
  bool? photoController;

  // portrait
  Rx<File>? portrait;
  Rx<File>? idCardFrontPhoto;
  Rx<File>? idCardBackPhoto;

  final ImagePicker _picker = ImagePicker();

  Future<File> imgFromGallery() async {
    final pickedImages = await _picker.pickImage(source: ImageSource.gallery);
    return File(pickedImages!.path);
  }

  Future<File> imgFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    } else {
      return File('');
    }
  }
}
