import 'package:equatable/equatable.dart';

class PropertyTypeEntity extends Equatable {
  final String? id;
  final String? name;
  final bool? isActive;

  const PropertyTypeEntity({
    this.id,
    this.name,
    this.isActive,
  });

  @override
  List<Object?> get props => [id, name, isActive];

  PropertyTypeEntity copyWith({
    String? id,
    String? name,
    bool? isActive,
  }) {
    return PropertyTypeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
    );
  }
}
