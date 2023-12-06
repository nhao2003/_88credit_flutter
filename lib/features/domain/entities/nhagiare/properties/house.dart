import '../../../enums/direction.dart';
import '../../../enums/furniture_status.dart';
import '../../../enums/house_types.dart';
import '../../../enums/legal_document_status.dart';
import 'property_feature.dart';

class House implements PropertyFeature {
  final HouseTypes? houseType;
  final int? numOfBedRooms;
  final int? numOfToilets;
  final int? numOfFloors;
  final Direction? mainDoorDirection;
  final double? areaUsed;
  final double? width;
  final double? length;
  final bool? isWidensTowardsTheBack;
  final bool? hasWideAlley;
  final bool? isFacade;
  final LegalDocumentStatus? legalDocumentStatus;
  final FurnitureStatus? furnitureStatus;
  final String? houseNumber;
  final bool? showHouseNumber;

  House(
    this.houseType,
    this.numOfBedRooms,
    this.isWidensTowardsTheBack,
    this.numOfToilets,
    this.numOfFloors,
    this.mainDoorDirection,
    this.width,
    this.length,
    this.areaUsed,
    this.legalDocumentStatus,
    this.houseNumber,
    this.showHouseNumber,
    this.furnitureStatus,
    this.hasWideAlley,
    this.isFacade,
  );

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      json['house_type'] != null ? HouseTypes.parse(json['house_type']) : null,
      json['num_of_bed_rooms'],
      json['is_widens_towards_the_back'],
      json['num_of_toilets'],
      json['num_of_floors'],
      json['main_door_direction'] != null
          ? Direction.parse(json['main_door_direction'])
          : null,
      json['width'] != null ? double.parse(json['width'].toString()) : null,
      json['length'] != null ? double.parse(json['length'].toString()) : null,
      json['area_used'] != null
          ? double.parse(json['area_used'].toString())
          : null,
      json['legal_document_status'] != null
          ? LegalDocumentStatus.parse(json['legal_document_status'])
          : null,
      json['house_number'],
      json['show_house_number'],
      json['furniture_status'] != null
          ? FurnitureStatus.parse(json['furniture_status'])
          : null,
      json['has_wide_alley'],
      json['is_facade'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'house_type': houseType?.toString(),
      'num_of_bed_rooms': numOfBedRooms,
      'is_widens_towards_the_back': isWidensTowardsTheBack,
      'num_of_toilets': numOfToilets,
      'num_of_floors': numOfFloors,
      'main_door_direction': mainDoorDirection?.toString(),
      'width': width,
      'length': length,
      'area_used': areaUsed,
      'legal_document_status': legalDocumentStatus?.toString(),
      'house_number': houseNumber,
      'show_house_number': showHouseNumber,
      'furniture_status': furnitureStatus?.toString(),
      'has_wide_alley': hasWideAlley,
      'is_facade': isFacade,
    };
  }
}
