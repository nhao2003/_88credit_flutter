import 'package:_88credit_flutter/features/domain/entities/credit/bank.dart';

class BankModel extends BankEntity {
  const BankModel({
    required super.id,
    required super.name,
    required super.code,
    required super.bin,
    required super.shortName,
    required super.logo,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      bin: json['bin'] as String,
      shortName: json['short_name'] as String,
      logo: json['logo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'bin': bin,
      'short_name': shortName,
      'logo': logo,
    };
  }

  // from entity
  factory BankModel.fromEntity(BankEntity entity) {
    return BankModel(
      id: entity.id,
      name: entity.name,
      code: entity.code,
      bin: entity.bin,
      shortName: entity.shortName,
      logo: entity.logo,
    );
  }
}
