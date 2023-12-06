import 'package:equatable/equatable.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../injection_container.dart';
import '../../../usecases/address/get_address.dart';

class AddressEntity extends Equatable {
  final int? provinceCode;
  final int? districtCode;
  final int? wardCode;
  final String? detail;

  AddressEntity({
    this.provinceCode,
    this.districtCode,
    this.wardCode,
    this.detail,
  }) : assert(detail?.trim().isNotEmpty ?? true);

  Map<String, dynamic> toJson() => {
        'province_code': provinceCode,
        'district_code': districtCode,
        'ward_code': wardCode,
        'detail': detail,
      };

  AddressEntity.fromJson(Map<String, dynamic> json)
      : provinceCode = json['province_code'],
        districtCode = json['district_code'],
        wardCode = json['ward_code'],
        detail = json['detail'];

  @override
  String toString() {
    String result = "";
    result += detail != null ? "$detail, " : "";
    result += wardCode != null ? "$wardCode, " : "";
    result += districtCode != null ? "$districtCode, " : "";
    result += provinceCode != null ? "$provinceCode" : "";
    return result;
  }

  String getDetailAddress() {
    final GetAddressUseCase getAddressUseCase = sl<GetAddressUseCase>();
    final dataState = getAddressUseCase(
      params: this,
    );

    if (dataState is DataSuccess) {
      return dataState.data!;
    } else {
      return toString();
    }
  }

  @override
  List<Object?> get props => [provinceCode];
}
