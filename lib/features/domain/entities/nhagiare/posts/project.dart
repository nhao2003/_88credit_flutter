import 'package:_88credit_flutter/features/domain/entities/nhagiare/posts/address.dart';
import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final String? id;
  final String? developerId;
  final String? projectName;
  final double? totalArea;
  final DateTime? startingDate;
  final DateTime? completionDate;
  final AddressEntity? address;
  final String? progression;
  final String? status;
  final List<String>? images;
  final bool? verified;
  final bool? isActive;

  const ProjectEntity({
    this.id,
    this.developerId,
    this.projectName,
    this.totalArea,
    this.startingDate,
    this.completionDate,
    this.address,
    this.progression,
    this.status,
    this.images,
    this.verified,
    this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        developerId,
        projectName,
        totalArea,
        startingDate,
        completionDate,
        address,
        progression,
        status,
        images,
        verified,
        isActive,
      ];

  ProjectEntity copyWith({
    String? uuid,
    String? developerId,
    String? projectName,
    double? totalArea,
    DateTime? startingDate,
    DateTime? completionDate,
    AddressEntity? address,
    String? progression,
    String? status,
    List<String>? images,
    bool? verified,
    bool? isActive,
  }) {
    return ProjectEntity(
      id: uuid ?? id,
      developerId: developerId ?? this.developerId,
      projectName: projectName ?? this.projectName,
      totalArea: totalArea ?? this.totalArea,
      startingDate: startingDate ?? this.startingDate,
      completionDate: completionDate ?? this.completionDate,
      address: address ?? this.address,
      progression: progression ?? this.progression,
      status: status ?? this.status,
      images: images ?? this.images,
      verified: verified ?? this.verified,
      isActive: isActive ?? this.isActive,
    );
  }
}
