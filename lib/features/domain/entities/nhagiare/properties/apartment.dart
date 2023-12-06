import '../../../enums/apartment_types.dart';
import '../../../enums/furniture_status.dart';
import '../../../enums/legal_document_status.dart';
import 'property_feature.dart';

class Apartment implements PropertyFeature {
  final ApartmentTypes? apartmentType;
  final bool? isHandOver;
  final int? numOfBedRooms;
  final FurnitureStatus? furnitureStatus;
  final int? numOfToilets;
  final String? balconyDirection;
  final String? block;
  final String? floor;
  final LegalDocumentStatus? legalDocumentStatus;
  final String? apartmentNumber;
  final bool? showApartmentNumber;

  Apartment(
    this.apartmentType,
    this.isHandOver,
    this.numOfBedRooms,
    this.furnitureStatus,
    this.numOfToilets,
    this.balconyDirection,
    this.block,
    this.floor,
    this.legalDocumentStatus,
    this.apartmentNumber,
    this.showApartmentNumber,
  );

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(
      json['apartment_type'] != null
          ? ApartmentTypes.parse(json['apartment_type'])
          : null,
      json['is_hand_over'],
      json['num_of_bed_rooms'],
      json['furniture_status'] != null
          ? FurnitureStatus.parse(json['furniture_status'])
          : null,
      json['num_of_toilets'],
      json['balcony_direction'],
      json['block'],
      json['floor'],
      json['legal_document_status'] != null
          ? LegalDocumentStatus.parse(json['legal_document_status'])
          : null,
      json['apartment_number'],
      json['show_apartment_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apartment_type': apartmentType?.toString(),
      'is_hand_over': isHandOver,
      'num_of_bed_rooms': numOfBedRooms,
      'furniture_status': furnitureStatus?.toString(),
      'num_of_toilets': numOfToilets,
      'balcony_direction': balconyDirection,
      'block': block,
      'floor': floor,
      'legal_document_status': legalDocumentStatus?.toString(),
      'apartment_number': apartmentNumber,
      'show_apartment_number': showApartmentNumber,
    };
  }
}
