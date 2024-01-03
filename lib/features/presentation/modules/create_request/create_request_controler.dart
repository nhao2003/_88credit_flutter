import 'dart:io';
import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/loan_request.dart';
import 'package:_88credit_flutter/features/domain/usecases/bank/get_primary_bank_card.dart';
import 'package:_88credit_flutter/features/domain/usecases/contract/create_loan_request.dart';
import 'package:_88credit_flutter/features/domain/usecases/user/search_user_usecase.dart';
import 'package:_88credit_flutter/features/domain/usecases/media/upload_videos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../config/theme/app_color.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/pair.dart';
import '../../../../injection_container.dart';
import '../../../data/models/credit/user.dart';
import '../../../domain/entities/credit/user.dart';
import '../../../domain/enums/loan_contract_request_status.dart';
import '../../../domain/enums/loan_reason_types.dart';
import '../../../domain/enums/role.dart';
import '../../../domain/enums/user_status.dart';
import '../../../domain/usecases/media/upload_images.dart';

class CreateRequestController extends GetxController {
  RxBool isLoading = false.obs;
  toggleIsLoading(bool value) {
    isLoading.value = value;
  }

  // create Request
  final requestFormKey = GlobalKey<FormState>();

  Future<void> createRequest() async {
    toggleIsLoading(true);
    CreateRequestsUseCase createRequestsUseCase = sl<CreateRequestsUseCase>();

    if (!validatorForm()) return;
    final LoanRequestEntity requestEntity = await getNewRequest();

    final dataState = await createRequestsUseCase(params: requestEntity);

    if (dataState is DataSuccess) {
      toggleIsLoading(false);
      Get.back();
      Get.snackbar(
        'Tạo yêu cầu thành công',
        'Vào mục hợp đồng để xem yêu cầu của bạn',
        backgroundColor: AppColors.green,
        colorText: Colors.white,
      );
    } else {
      toggleIsLoading(false);
      Get.snackbar(
        'Tạo yêu cầu thất bại',
        '',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  bool validatorForm() {
    return requestFormKey.currentState!.validate();
  }

  Future<LoanRequestEntity> getNewRequest() async {
    if (portrait.value == null ||
        idCardFrontPhoto.value == null ||
        idCardBackPhoto.value == null ||
        video.value == null) {
      Get.snackbar(
        'Vui lòng chọn ảnh',
        '',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return Future.error('Vui lòng chọn ảnh');
    }
    List responses = await Future.wait([
      uploadImages(portrait.value!),
      uploadImages(idCardFrontPhoto.value!),
      uploadImages(idCardBackPhoto.value!),
      uploadVideos(video.value!),
    ]);

    String portraitUrl = responses[0][0];
    String idCardFrontPhotoUrl = responses[1][0];
    String idCardBackPhotoUrl = responses[2][0];
    String videoUrl = responses[3][0];

    return LoanRequestEntity(
      receiver: receiver.value,
      description: discription,
      loanAmount: loanAmount,
      interestRate: interestRate,
      overdueInterestRate: overdueInterestRate,
      loanTenureMonths: tenureMonths,
      loanReasonType: loanReasonType.value,
      loanReason: loanReason,
      portaitPhoto: portraitUrl,
      idCardFrontPhoto: idCardFrontPhotoUrl,
      idCardBackPhoto: idCardBackPhotoUrl,
      videoConfirmation: videoUrl,
      senderBankCardId: primaryBankCard.value!.id,
      status: LoanContractRequestStatus.pending,
      createdAt: DateTime.now(),
    );
  }

  UploadImagesUseCase uploadImagessUseCase = sl<UploadImagesUseCase>();
  Future<List<String>> uploadImages(File image) async {
    final dataState = await uploadImagessUseCase(params: [image]);

    if (dataState is DataSuccess) {
      toggleIsLoading(false);
      return dataState.data!;
    } else {
      toggleIsLoading(false);
      return [];
    }
  }

  UploadVideosUseCase uploadVideosUseCase = sl<UploadVideosUseCase>();
  Future<List<String>> uploadVideos(File image) async {
    final dataState = await uploadVideosUseCase(params: [image]);

    if (dataState is DataSuccess) {
      toggleIsLoading(false);
      return dataState.data!;
    } else {
      toggleIsLoading(false);
      return [];
    }
  }

  // vaule
  Rx<UserEntity> receiver = UserEntity(
    id: "3b05eb4a-346f-481c-a682-58e24e06d32e",
    status: UserStatus.verified,
    isIdentityVerified: true,
    role: Role.user,
    email: "user3@example.com",
    address: null,
    firstName: "Alex",
    lastName: "Johnson",
    gender: false,
    avatar: "https://picsum.photos/200/300?random=4",
    dob: null,
    phone: "123456789",
    lastActiveAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
    createdAt: DateTime.parse("2023-12-06T01:53:30.033Z"),
    updatedAt: null,
    bannedUtil: null,
    banReason: null,
  ).obs;

  changeReceiver(UserEntity user) {
    receiver.value = user;
  }

  // primary bank card
  RxBool isGetingPrimaryBankCard = false.obs;

  Rxn<BankCardEntity> primaryBankCard = Rxn(null);
  GetPrimaryBankCardUseCase getPrimaryBankCardUseCase =
      sl<GetPrimaryBankCardUseCase>();

  Future<void> getPrimaryBankCard() async {
    isGetingPrimaryBankCard.value = true;
    final dataState = await getPrimaryBankCardUseCase();
    primaryBankCard.value = dataState;
    isGetingPrimaryBankCard.value = false;
  }

  void navigateToBank() async {
    Get.toNamed(AppRoutes.bank)!.then((value) => getPrimaryBankCard());
  }

  // form

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

  List<String> timeTypes = ["Tháng", "Năm"];
  RxString timeValue = 'Tháng'.obs;
  void setTimeValue(String? value) {
    timeValue.value = value!;
  }

  // hinh anh
  bool? photoController;

  // portrait
  Rx<File?> portrait = Rxn(null);
  Rx<File?> idCardFrontPhoto = Rxn(null);
  Rx<File?> idCardBackPhoto = Rxn(null);

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

  // video
  Rx<File?> video = Rxn(null);
  Future<File> videoFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickVideo(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    } else {
      return File('');
    }
  }

  Future<File> videoFromGallery() async {
    final pickedImages = await _picker.pickVideo(source: ImageSource.gallery);
    return File(pickedImages!.path);
  }

  // user list
  final SearchUserUseCase searchUserUseCase = sl<SearchUserUseCase>();

  Future<Pair<int, List<UserModel>>> searchUser(String value, int page) async {
    final dataState = await searchUserUseCase.call(params: Pair(value, page));
    return dataState;
  }
}
