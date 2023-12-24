import 'dart:io';
import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import 'package:_88credit_flutter/features/domain/enums/post_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../config/theme/app_color.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../injection_container.dart';
import '../../../domain/enums/loan_reason_types.dart';
import '../../../domain/usecases/media/upload_images.dart';
import '../../../domain/usecases/post/remote/create_post.dart';

class CreatePostController extends GetxController {
  RxBool isLoading = false.obs;
  toggleIsLoading(bool value) {
    isLoading.value = value;
  }

  // create Post
  final infoFormKey = GlobalKey<FormState>();
  final lendingFormKey = GlobalKey<FormState>();
  final borrowingFormKey = GlobalKey<FormState>();

  Future<void> createPost() async {
    toggleIsLoading(true);
    CreatePostsUseCase createPostsUseCase = sl<CreatePostsUseCase>();

    if (!validatorForm()) return;
    final PostEntity post = await getNewPost();

    final dataState = await createPostsUseCase(params: post);

    if (dataState is DataSuccess) {
      toggleIsLoading(false);
      Get.back();
      Get.snackbar(
        'Đăng bài thành công',
        'Vào mục quản lý tin để xem bài của bạn',
        backgroundColor: AppColors.green,
        colorText: Colors.white,
      );
    } else {
      toggleIsLoading(false);
      Get.snackbar(
        'Đăng bài thất bại',
        '',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  bool validatorForm() {
    bool isValidate = true;
    isValidate = isValidate & infoFormKey.currentState!.validate();
    if (isLending.value) {
      isValidate = isValidate & lendingFormKey.currentState!.validate();
    } else {
      isValidate = isValidate & borrowingFormKey.currentState!.validate();
    }
    return isValidate;
  }

  Future<PostEntity> getNewPost() async {
    List<String> images = await uploadImages();

    if (isLending.value) {
      // Lending
      return PostEntity(
        type: isLending.value ? PostTypes.lending : PostTypes.borrowing,
        title: title,
        description: description,
        images: images,
        loanAmount: lendingLoanAmount,
        maxLoanAmount: lendingMaxLoanAmount,
        interestRate: lendingInterestRate,
        maxInterestRate: lendingMaxInterestRate,
        tenureMonths: lendingTenureMonths,
        maxTenureMonths: lendingMaxTenureMonths,
        overdueInterestRate: lendingOverdueInterestRate,
        maxOverdueInterestRate: lendingMaxOverdueInterestRate,
      );
    } else {
      return PostEntity(
        type: isLending.value ? PostTypes.lending : PostTypes.borrowing,
        title: title,
        description: description,
        images: images,
        loanAmount: borrowingLoanAmount,
        interestRate: borrowingInterestRate,
        tenureMonths: borrowingTenureMonths,
        loanReasonType: borrowingLoanReasonType.value,
        loanReason: borrowingLoanReason,
      );
    }
  }

  Future<List<String>> uploadImages() async {
    UploadImagesUseCase uploadImagessUseCase = sl<UploadImagesUseCase>();

    final dataState = await uploadImagessUseCase(params: photo);

    if (dataState is DataSuccess) {
      toggleIsLoading(false);
      return dataState.data!;
    } else {
      toggleIsLoading(false);
      return [];
    }
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
  final borrowingOverdueInterestRateTextController = TextEditingController();
  double? borrowingOverdueInterestRate;
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
