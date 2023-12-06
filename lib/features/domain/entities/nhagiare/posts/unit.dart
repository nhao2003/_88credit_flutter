import 'package:equatable/equatable.dart';

class UnitEntity extends Equatable {
  final String? id;
  final String? name;
  final bool? isActive;

  const UnitEntity({
    this.id,
    this.name,
    this.isActive,
  });

  @override
  List<Object?> get props => [id, name, isActive];

  UnitEntity copyWith({
    String? id,
    String? name,
    bool? isActive,
  }) {
    return UnitEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
    );
  }
}
