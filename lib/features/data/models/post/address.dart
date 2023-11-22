import 'package:_88credit_flutter/features/domain/entities/posts/address.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    final int? provinceCode,
    final String? cityName,
    final int? districtCode,
    final String? districtName,
    final int? wardCode,
    final String? wardName,
    final String? detail,
    final double? latitude,
    final double? longitude,
  }) : super(
          provinceCode: provinceCode,
          districtCode: districtCode,
          wardCode: wardCode,
          detail: detail,
        );

  @override
  Map<String, dynamic> toJson() => {
        'city_code': provinceCode,
        'district_code': districtCode,
        'ward_code': wardCode,
        'detail': detail,
      };

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      provinceCode: json['city_code'],
      districtCode: json['district_code'],
      wardCode: json['ward_code'],
      detail: json['detail'],
    );
  }

  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      provinceCode: entity.provinceCode,
      districtCode: entity.districtCode,
      wardCode: entity.wardCode,
      detail: entity.detail,
    );
  }
}
