import 'package:dio/dio.dart';
import 'package:_88credit_flutter/core/resources/data_state.dart';
import '../../domain/repository/provinces_repository.dart';
import '../data_sources/local/provinces_json.dart';

class ProvincesRepositoryImpl implements ProvincesRepository {
  @override
  DataState<String> getFullAddress(
      String? detail, int provinceCode, int districtCode, int wardCode) {
    try {
      String provinceName = provinceCode.toString();
      String districtName = districtCode.toString();
      String wardName = districtCode.toString();
      for (Map<String, Object> province in provincesVietNam) {
        if (province['code'] == provinceCode) {
          provinceName = province['name'] as String;
          for (Map<String, Object> district in province['districts'] as List) {
            if (district['code'] == districtCode) {
              districtName = district['name'] as String;
              for (Map<String, Object> ward in district['wards'] as List) {
                if (ward['code'] == wardCode) {
                  wardName = ward['name'] as String;
                }
              }
            }
          }
        }
      }

      String detailAddress = detail != null ? "$detail, " : "";
      String result = '$detailAddress$wardName, $districtName, $provinceName';

      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  DataState<String> getProvinceName(int provinceCode) {
    try {
      String provinceName = provinceCode.toString();
      for (Map<String, Object> province in provincesVietNam) {
        if (province['code'] == provinceCode) {
          provinceName = province['name'] as String;
        }
      }
      return DataSuccess(provinceName);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  DataState<String> getDistrictName(int provinceCode, int districtCode) {
    try {
      String districtName = districtCode.toString();
      for (Map<String, Object> province in provincesVietNam) {
        if (province['code'] == provinceCode) {
          for (Map<String, Object> district in province['districts'] as List) {
            if (district['code'] == districtCode) {
              districtName = district['name'] as String;
            }
          }
        }
      }
      return DataSuccess(districtName);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  DataState<String> getWardName(
      int provinceCode, int districtCode, int wardCode) {
    try {
      String wardName = districtCode.toString();
      for (Map<String, Object> province in provincesVietNam) {
        if (province['code'] == provinceCode) {
          for (Map<String, Object> district in province['districts'] as List) {
            if (district['code'] == districtCode) {
              for (Map<String, Object> ward in district['wards'] as List) {
                if (ward['code'] == wardCode) {
                  wardName = ward['name'] as String;
                }
              }
            }
          }
        }
      }
      return DataSuccess(wardName);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  DataState<int> getProvinceCode(String provinceName) {
    // TODO: implement getProvinceCode
    throw UnimplementedError();
  }

  @override
  DataState<int> getDistrictCode(String districtName) {
    // TODO: implement getDistrictCode
    throw UnimplementedError();
  }

  @override
  DataState<int> getWardCode(String wardName) {
    // TODO: implement getWardCode
    throw UnimplementedError();
  }

  @override
  DataState<List<String>> getProvinceNames() {
    try {
      List<String> provinceNames = [];
      for (Map<String, Object> province in provincesVietNam) {
        provinceNames.add(province['name'] as String);
      }
      return DataSuccess(provinceNames);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
