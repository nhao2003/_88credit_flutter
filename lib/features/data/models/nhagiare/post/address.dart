import '../../../../domain/entities/nhagiare/posts/address.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    super.provinceCode,
    final String? cityName,
    super.districtCode,
    final String? districtName,
    super.wardCode,
    final String? wardName,
    super.detail,
    final double? latitude,
    final double? longitude,
  });

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
