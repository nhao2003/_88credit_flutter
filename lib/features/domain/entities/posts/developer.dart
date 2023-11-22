import 'package:equatable/equatable.dart';

class DeveloperEntity extends Equatable {
  final String? id;
  final String? description;
  final List<String>? images;
  final DateTime? createdAt;
  final bool? isActive;
  final String? name;

  const DeveloperEntity({
    this.id,
    this.description,
    this.images,
    this.createdAt,
    this.isActive,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        images,
        createdAt,
        isActive,
        name,
      ];

  DeveloperEntity copyWith({
    String? id,
    String? description,
    List<String>? images,
    DateTime? createdAt,
    bool? isActive,
    String? name,
  }) {
    return DeveloperEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      name: name ?? this.name,
    );
  }
}
