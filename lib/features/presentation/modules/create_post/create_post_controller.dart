import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:_88credit_flutter/features/domain/enums/apartment_types.dart';
import 'package:_88credit_flutter/features/domain/enums/direction.dart';
import 'package:_88credit_flutter/features/domain/enums/furniture_status.dart';
import 'package:_88credit_flutter/features/domain/enums/land_types.dart';
import 'package:_88credit_flutter/features/domain/enums/office_types.dart';
import '../../../domain/enums/house_types.dart';
import '../../../domain/enums/legal_document_status.dart';
import '../../../domain/enums/property_types.dart';

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

  // card choose type property
  Rxn<PropertyTypes> selectedPropertyType = Rxn(null);
  bool isReachLimitPost = false;
  Rx<bool> isLease = true.obs;

  void changeSelectedProperty(PropertyTypes value) {
    selectedPropertyType.value = value;
  }

  void setIsLease(bool value) {
    isLease.value = value;
    if (value && selectedPropertyType.value == PropertyTypes.motel) {
      selectedPropertyType.value = Rxn(null).value;
    }
  }

  // card choose type of user
  RxBool isProSeller = true.obs;
  void setRole(bool value) {
    isProSeller.value = value;
  }

  // card post info
  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  String? title;
  String? description;

  // dia chi, hinh anh
  final apartmentNameTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final blockTextController = TextEditingController();
  final floorTextController = TextEditingController();
  String? apartmentName;
  String? block;
  String? floor;
  String? address;

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

  // Motel ======================================================
  // thong tin chi tiet
  double? motelWaterPrice;
  double? motelElectricPrice;
  final motelWaterPriceTC = TextEditingController();
  final motelElectricPriceTC = TextEditingController();

  // Dien tich , gia tro
  final motelAreaTC = TextEditingController();
  final motelPriceTC = TextEditingController();
  final motelDepositTC = TextEditingController();
  String? motelArea;
  String? motelPrice;
  String? motelDeposit;

  // thong tin khac
  Rxn<FurnitureStatus> motelSelectedFurnitureStatus = Rxn(null);

  void setFurnitureStatus(FurnitureStatus value) {
    motelSelectedFurnitureStatus.value = value;
  }

  // Office ======================================================
  final officeNumberTC = TextEditingController();
  String? officeNumber;
  RxBool officeIsShowName = false.obs;
  void setofficeIsShowName(bool value) {
    officeIsShowName.value = value;
  }

  // thong tin chi tiet
  Rxn<OfficeTypes> officeType = Rxn(null);
  Rxn<Direction> officeMainDoorDirection = Rxn(null);

  void setOfficeType(OfficeTypes value) {
    officeType.value = value;
  }

  void setOfficeMainDoorDirection(Direction value) {
    officeMainDoorDirection.value = value;
  }

  // Dien tich , gia tro
  final officeAreaTC = TextEditingController();
  final officePriceTC = TextEditingController();
  final officeDepositTC = TextEditingController();
  String? officeArea;
  String? officePrice;
  String? officeDeposit;
  // thong tin khac
  Rxn<LegalDocumentStatus> officeLegalDocumentStatus = Rxn(null);
  Rxn<FurnitureStatus> officeFurnitureStatus = Rxn(null);
  RxBool officeIsFacade = false.obs;

  void setOfficeLegalDocumentStatus(LegalDocumentStatus value) {
    officeLegalDocumentStatus.value = value;
  }

  void setOfficeFurnitureStatus(FurnitureStatus value) {
    officeFurnitureStatus.value = value;
  }

  void setOfficeIsFacade(bool value) {
    officeIsFacade.value = value;
  }

  // Land ======================================================
  final landSubdivisionNameTC = TextEditingController();
  final landLotCodeTC = TextEditingController();
  String? landSubdivisionName;
  String? landLotCode;
  RxBool isShowLandLotCode = false.obs;

  void setIsShowLandLotCode(bool value) {
    isShowLandLotCode.value = value;
  }

  Rxn<LandTypes> landType = Rxn(null);
  Rxn<Direction> landDirection = Rxn(null);

  void setLandType(LandTypes value) {
    landType.value = value;
  }

  void setLandDirection(Direction value) {
    landDirection.value = value;
  }

  // dien tich & gia
  final landAreaTC = TextEditingController();
  final landPriceTC = TextEditingController();
  final landDepositTC = TextEditingController();
  final landWidthTC = TextEditingController();
  final landLengthTC = TextEditingController();
  String? landArea;
  String? landPrice;
  String? landDeposit;
  String? landWidth;
  String? landLength;

  // thong tin khac
  Rxn<LegalDocumentStatus> landLegalDocumentStatus = Rxn(null);

  void setLandLegalDocumentStatus(LegalDocumentStatus value) {
    landLegalDocumentStatus.value = value;
  }

  RxBool landIsFacade = false.obs;
  RxBool landHasWideAlley = false.obs;
  RxBool landIsWidensTowardsTheBack = false.obs;

  void setLandIsFacade(bool value) {
    landIsFacade.value = value;
  }

  void setLandHasWideAlley(bool value) {
    landHasWideAlley.value = value;
  }

  void setLandIsWidensTowardsTheBack(bool value) {
    landIsWidensTowardsTheBack.value = value;
  }

  // house ======================================================
  Rxn<HouseTypes> houseType = Rxn(null);
  void setHouseType(HouseTypes value) {
    houseType.value = value;
  }

  String? houseNumOfBedRooms;
  final houseNumOfBedRoomsTC = TextEditingController();

  String? houseNumOfToilets;
  final houseNumOfToiletsTC = TextEditingController();

  String? houseNumOfFloors;
  final houseNumOfFloorsTC = TextEditingController();

  Rxn<Direction> houseMainDoorDirection = Rxn(null);
  void setHouseMainDoorDirection(Direction value) {
    houseMainDoorDirection.value = value;
  }

  String? houseNumber;
  final houseNumberTC = TextEditingController();

  RxBool isShowHouseNumber = false.obs;
  void setIsShowHouseNumber(bool value) {
    isShowHouseNumber.value = value;
  }

  // dien tich & gia
  final houseAreaTC = TextEditingController();
  final houseAreaUsedTC = TextEditingController();
  final housePriceTC = TextEditingController();
  final houseDepositTC = TextEditingController();
  final houseWidthTC = TextEditingController();
  final houseLengthTC = TextEditingController();
  String? houseArea;
  String? houseAreaUsed;
  String? housePrice;
  String? houseDeposit;
  String? houseWidth;
  String? houseLength;

  // thong tin khac
  Rxn<LegalDocumentStatus> houseLegalDocumentStatus = Rxn(null);
  Rxn<FurnitureStatus> houseFurnitureStatus = Rxn(null);
  void sethouseLegalDocumentStatus(LegalDocumentStatus value) {
    houseLegalDocumentStatus.value = value;
  }

  void setHouseFurnitureStatus(FurnitureStatus value) {
    houseFurnitureStatus.value = value;
  }

  RxBool houseIsFacade = false.obs;
  RxBool houseHasWideAlley = false.obs;
  RxBool houseIsWidensTowardsTheBack = false.obs;

  void sethouseIsFacade(bool value) {
    houseIsFacade.value = value;
  }

  void sethouseHasWideAlley(bool value) {
    houseHasWideAlley.value = value;
  }

  void sethouseIsWidensTowardsTheBack(bool value) {
    houseIsWidensTowardsTheBack.value = value;
  }

  // apartment ======================================================
  RxBool officeIsHandOver = true.obs;
  void setOfficeIsHandOver(bool value) {
    officeIsHandOver.value = value;
  }

  Rxn<ApartmentTypes> apartmentType = Rxn(null);
  void setapartmentType(ApartmentTypes value) {
    apartmentType.value = value;
  }

  String? apartmentNumOfBedRooms;
  final apartmentNumOfBedRoomsTC = TextEditingController();

  String? apartmentNumOfToilets;
  final apartmentNumOfToiletsTC = TextEditingController();

  Rxn<Direction> apartmentBalconyDirection = Rxn(null);
  void setapartmentBalconyDirection(Direction value) {
    apartmentBalconyDirection.value = value;
  }

  String? apartmentNumber;
  final apartmentNumberTC = TextEditingController();

  RxBool isShowapartmentNumber = false.obs;
  void setIsShowapartmentNumber(bool value) {
    isShowapartmentNumber.value = value;
  }

  // dien tich & gia
  final apartmentAreaTC = TextEditingController();
  final apartmentPriceTC = TextEditingController();
  final apartmentDepositTC = TextEditingController();
  String? apartmentArea;
  String? apartmentPrice;
  String? apartmentDeposit;

  // thong tin khac
  Rxn<LegalDocumentStatus> apartmentLegalDocumentStatus = Rxn(null);
  Rxn<FurnitureStatus> apartmentFurnitureStatus = Rxn(null);
  void setapartmentLegalDocumentStatus(LegalDocumentStatus value) {
    apartmentLegalDocumentStatus.value = value;
  }

  void setapartmentFurnitureStatus(FurnitureStatus value) {
    apartmentFurnitureStatus.value = value;
  }

  RxBool apartmentIsCorner = false.obs;

  void setapartmentIsCorner(bool value) {
    apartmentIsCorner.value = value;
  }
}
