import '../../../domain/entities/posts/developer.dart';

class DeveloperModel extends DeveloperEntity {
  const DeveloperModel({
    String? id,
    String? description,
    List<String>? images,
    DateTime? createdAt,
    bool? isActive,
    String? name,
  }) : super(
          id: id,
          description: description,
          images: images,
          createdAt: createdAt,
          isActive: isActive,
          name: name,
        );

  factory DeveloperModel.fromJson(Map<String, dynamic> json) {
    return DeveloperModel(
      id: json['id'],
      description: json['description'],
      images: List<String>.from(json['images']),
      createdAt: DateTime.parse(json['created_at']),
      isActive: json['is_active'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'images': images,
      'created_at': createdAt!.toIso8601String(),
      'is_active': isActive,
      'name': name,
    };
  }

  factory DeveloperModel.fromEntity(DeveloperEntity entity) {
    return DeveloperModel(
      id: entity.id,
      description: entity.description,
      images: entity.images,
      createdAt: entity.createdAt,
      isActive: entity.isActive,
      name: entity.name,
    );
  }
}
