import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';

class PostModel extends PostEntity {
  const PostModel({
    super.id,
    super.userId,
    super.type,
    super.loanReasonType,
    super.loanReason,
    super.status,
    super.title,
    super.description,
    super.images,
    super.createdAt,
    super.updatedAt,
    super.interestRate,
    super.loanAmount,
    super.tenureMonths,
    super.overdueInterestRate,
    super.maxInterestRate,
    super.maxLoanAmount,
    super.maxTenureMonths,
    super.maxOverdueInterestRate,
    super.rejectedReason,
    super.deletedAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['user_id'],
      type: json['type'],
      loanReasonType: json['loan_reason_type'],
      loanReason: json['loan_reason'],
      status: json['status'],
      title: json['title'],
      description: json['description'],
      images: List<String>.from(json['images'] ?? []),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      interestRate: json['interest_rate'],
      loanAmount: json['loan_amount'],
      tenureMonths: json['tenure_months'],
      overdueInterestRate: json['overdue_interest_rate'],
      maxInterestRate: json['max_interest_rate'],
      maxLoanAmount: json['max_loan_amount'],
      maxTenureMonths: json['max_tenure_months'],
      maxOverdueInterestRate: json['max_overdue_interest_rate'],
      rejectedReason: json['rejected_reason'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'type': type,
      'loan_reason_type': loanReasonType,
      'loan_reason': loanReason,
      'status': status,
      'title': title,
      'description': description,
      'images': images,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'interest_rate': interestRate,
      'loan_amount': loanAmount,
      'tenure_months': tenureMonths,
      'overdue_interest_rate': overdueInterestRate,
      'max_interest_rate': maxInterestRate,
      'max_loan_amount': maxLoanAmount,
      'max_tenure_months': maxTenureMonths,
      'max_overdue_interest_rate': maxOverdueInterestRate,
      'rejected_reason': rejectedReason,
      'deleted_at': deletedAt,
    };
  }

  factory PostModel.fromEntity(PostEntity entity) {
    return PostModel(
      id: entity.id,
      userId: entity.userId,
      type: entity.type,
      loanReasonType: entity.loanReasonType,
      loanReason: entity.loanReason,
      status: entity.status,
      title: entity.title,
      description: entity.description,
      images: entity.images,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      interestRate: entity.interestRate,
      loanAmount: entity.loanAmount,
      tenureMonths: entity.tenureMonths,
      overdueInterestRate: entity.overdueInterestRate,
      maxInterestRate: entity.maxInterestRate,
      maxLoanAmount: entity.maxLoanAmount,
      maxTenureMonths: entity.maxTenureMonths,
      maxOverdueInterestRate: entity.maxOverdueInterestRate,
      rejectedReason: entity.rejectedReason,
      deletedAt: entity.deletedAt,
    );
  }
}
