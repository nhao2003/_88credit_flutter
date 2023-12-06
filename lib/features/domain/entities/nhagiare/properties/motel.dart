import '../../../enums/furniture_status.dart';
import 'property_feature.dart';

class Motel implements PropertyFeature {
  final double? waterPrice;
  final double? electricPrice;
  final FurnitureStatus? furnitureStatus;

  Motel(this.waterPrice, this.electricPrice, this.furnitureStatus);

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      json['water_price'] != null
          ? double.parse(json['water_price'].toString())
          : null,
      json['electric_price'] != null
          ? double.parse(json['electric_price'].toString())
          : null,
      json['furniture_status'] != null
          ? FurnitureStatus.parse(json['furniture_status'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'water_price': waterPrice,
      'electric_price': electricPrice,
      'furniture_status': furnitureStatus?.toString(),
    };
  }
}
