import '../../../../domain/entities/nhagiare/posts/unit.dart';

class UnitModel extends UnitEntity {
  const UnitModel({
    super.id,
    super.name,
    super.isActive,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) {
    return UnitModel(
      id: json['id'],
      name: json['name'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'is_active': isActive,
    };
  }

  factory UnitModel.fromEntity(UnitEntity entity) {
    return UnitModel(
      id: entity.id,
      name: entity.name,
      isActive: entity.isActive,
    );
  }
}
