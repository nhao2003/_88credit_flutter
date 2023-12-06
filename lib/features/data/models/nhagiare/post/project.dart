import '../../../../domain/entities/nhagiare/posts/address.dart';
import '../../../../domain/entities/nhagiare/posts/project.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    super.id,
    super.developerId,
    super.projectName,
    super.totalArea,
    super.startingDate,
    super.completionDate,
    super.address,
    super.progression,
    super.status,
    super.images,
    super.verified,
    super.isActive,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      developerId: json['developer_id'],
      projectName: json['project_name'],
      totalArea: json['total_area'],
      startingDate: DateTime.parse(json['starting_date']),
      completionDate: DateTime.parse(json['completion_date']),
      address: AddressEntity.fromJson(json['address']),
      progression: json['progression'],
      status: json['status'],
      images: List<String>.from(json['images']),
      verified: json['verified'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'developer_id': developerId,
      'project_name': projectName,
      'total_area': totalArea,
      'starting_date': startingDate!.toIso8601String(),
      'completion_date': completionDate!.toIso8601String(),
      'address': address?.toJson(),
      'progression': progression,
      'status': status,
      'images': images,
      'verified': verified,
      'is_active': isActive,
    };
  }

  factory ProjectModel.fromEntity(ProjectEntity entity) {
    return ProjectModel(
      id: entity.id,
      developerId: entity.developerId,
      projectName: entity.projectName,
      totalArea: entity.totalArea,
      startingDate: entity.startingDate,
      completionDate: entity.completionDate,
      address: entity.address,
      progression: entity.progression,
      status: entity.status,
      images: entity.images,
      verified: entity.verified,
      isActive: entity.isActive,
    );
  }
}
