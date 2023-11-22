import 'package:_88credit_flutter/features/domain/entities/purchase/membership_package.dart';

class MembershipPackageModel extends MembershipPackageEntity {
  const MembershipPackageModel({
    required String id,
    required String name,
    required String description,
    required int pricePerMonth,
    required int monthlyPostLimit,
    required int displayPriorityPoint,
    required int postApprovalPriorityPoint,
    required DateTime createdAt,
    required bool isActive,
  }) : super(
          id: id,
          name: name,
          description: description,
          pricePerMonth: pricePerMonth,
          monthlyPostLimit: monthlyPostLimit,
          displayPriorityPoint: displayPriorityPoint,
          postApprovalPriorityPoint: postApprovalPriorityPoint,
          createdAt: createdAt,
          isActive: isActive,
        );

  factory MembershipPackageModel.fromJson(Map<String, dynamic> json) {
    return MembershipPackageModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      pricePerMonth: int.parse(json['price_per_month'] ?? 0),
      monthlyPostLimit: json['monthly_post_limit'] ?? 0,
      displayPriorityPoint: json['display_priority_point'] ?? 0,
      postApprovalPriorityPoint: json['post_approval_priority_point'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at']) ?? DateTime.now(),
      isActive: json['is_active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price_per_month': pricePerMonth,
      'monthly_post_limit': monthlyPostLimit,
      'display_priority_point': displayPriorityPoint,
      'post_approval_priority_point': postApprovalPriorityPoint,
      'created_at': createdAt,
      'is_active': isActive,
    };
  }

  factory MembershipPackageModel.fromEntity(MembershipPackageEntity entity) {
    return MembershipPackageModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      pricePerMonth: entity.pricePerMonth,
      monthlyPostLimit: entity.monthlyPostLimit,
      displayPriorityPoint: entity.displayPriorityPoint,
      postApprovalPriorityPoint: entity.postApprovalPriorityPoint,
      createdAt: entity.createdAt,
      isActive: entity.isActive,
    );
  }
}
