import '../../../../domain/entities/nhagiare/posts/property_type.dart';

class PropertyTypeModel extends PropertyTypeEntity {
  const PropertyTypeModel({
    super.id,
    super.name,
    super.isActive,
  });

  factory PropertyTypeModel.fromJson(Map<String, dynamic> json) {
    return PropertyTypeModel(
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

  factory PropertyTypeModel.fromEntity(PropertyTypeEntity entity) {
    return PropertyTypeModel(
      id: entity.id,
      name: entity.name,
      isActive: entity.isActive,
    );
  }
}
