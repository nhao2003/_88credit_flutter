import 'package:equatable/equatable.dart';

class MembershipPackageEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final int pricePerMonth;
  final int monthlyPostLimit;
  final int displayPriorityPoint;
  final int postApprovalPriorityPoint;
  final DateTime createdAt;
  final bool isActive;

  const MembershipPackageEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.pricePerMonth,
    required this.monthlyPostLimit,
    required this.displayPriorityPoint,
    required this.postApprovalPriorityPoint,
    required this.createdAt,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        pricePerMonth,
        monthlyPostLimit,
        displayPriorityPoint,
        postApprovalPriorityPoint,
        createdAt,
        isActive,
      ];
}
