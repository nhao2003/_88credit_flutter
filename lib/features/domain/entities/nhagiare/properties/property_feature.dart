import 'package:_88credit_flutter/features/domain/entities/nhagiare/properties/motel.dart';

import 'apartment.dart';
import 'house.dart';
import 'land.dart';
import 'office.dart';

abstract class PropertyFeature {
  static PropertyFeature fromJson(String type, Map<String, dynamic> data) {
    if (type == 'motel') {
      return Motel.fromJson(data);
    } else if (type == 'apartment') {
      return Apartment.fromJson(data);
    } else if (type == 'office') {
      return Office.fromJson(data);
    } else if (type == 'house') {
      return House.fromJson(data);
    } else if (type == 'land') {
      return Land.fromJson(data);
    } else {
      throw Exception('PropertyFeature: Invalid property type');
    }
  }
}
