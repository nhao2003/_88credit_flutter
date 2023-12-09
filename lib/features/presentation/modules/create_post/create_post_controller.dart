import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domain/enums/loan_reason_types.dart';

class CreatePostController extends GetxController {
  RxBool isLoading = false.obs;
  toggleIsLoading(bool value) {
    isLoading.value = value;
  }

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

  // choose is lending
  RxBool isLending = false.obs;
  setIsLending(bool value) {
    isLending.value = value;
  }

  // card post info
  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  String? title;
  String? description;

  // Lending form
  final lendingLoanAmountTextController = TextEditingController();
  double? lendingLoanAmount;
  final lendingMaxLoanAmountTextController = TextEditingController();
  double? lendingMaxLoanAmount;
  final lendingInterestRateTextController = TextEditingController();
  double? lendingInterestRate;
  final lendingMaxInterestRateTextController = TextEditingController();
  double? lendingMaxInterestRate;
  final lendingTenureMonthsTextController = TextEditingController();
  int? lendingTenureMonths;
  final lendingMaxTenureMonthsTextController = TextEditingController();
  int? lendingMaxTenureMonths;
  final lendingOverdueInterestRateTextController = TextEditingController();
  double? lendingOverdueInterestRate;
  final lendingMaxOverdueInterestRateTextController = TextEditingController();
  double? lendingMaxOverdueInterestRate;

  // Borrowing form
  final borrowingLoanAmountTextController = TextEditingController();
  double? borrowingLoanAmount;
  final borrowingInterestRateTextController = TextEditingController();
  double? borrowingInterestRate;
  final borrowingTenureMonthsTextController = TextEditingController();
  int? borrowingTenureMonths;
  final Rxn<LoanReasonTypes> borrowingLoanReasonType = Rxn(null);
  void setLoanReason(LoanReasonTypes value) {
    borrowingLoanReasonType.value = value;
  }

  final borrowingLoanReasonTextController = TextEditingController();
  String? borrowingLoanReason;

  // hinh anh
  bool? photoController;

  void checkLengthPhoto() {
    int length = photo.length + imageUrlList.length;
    if (length >= 3 && length <= 12) {
      photoController = true;
    } else {
      photoController = false;
    }
    update();
  }

  List<File> photo = [];
  List<String> imageUrlList = [];
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedImages = await _picker.pickMultiImage();
    for (int i = 0; i < pickedImages.length; i++) {
      photo.add(File(pickedImages[i].path));
    }
    checkLengthPhoto();
    update();
  }

  Future imgFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      photo.add(File(image.path));
      checkLengthPhoto();
      update();
    }
  }

  void deleteImage(int index) {
    if (index < imageUrlList.length) {
      imageUrlList.removeAt(index);
    } else {
      photo.removeAt(index - imageUrlList.length);
    }
    checkLengthPhoto();
    update();
  }
}
