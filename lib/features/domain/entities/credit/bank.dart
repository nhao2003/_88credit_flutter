import 'package:equatable/equatable.dart';

class BankEntity extends Equatable {
  final String id;
  final String name;
  final String code;
  final String bin;
  final String shortName;
  final String logo;

  const BankEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.bin,
    required this.shortName,
    required this.logo,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        bin,
        shortName,
        logo,
      ];

  BankEntity copyWith({
    String? id,
    String? name,
    String? code,
    String? bin,
    String? shortName,
    String? logo,
  }) {
    return BankEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      bin: bin ?? this.bin,
      shortName: shortName ?? this.shortName,
      logo: logo ?? this.logo,
    );
  }

  factory BankEntity.fromJson(Map<String, dynamic> json) {
    return BankEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      bin: json['bin'] as String,
      shortName: json['short_name'] as String,
      logo: json['logo'] as String,
    );
  }
}
