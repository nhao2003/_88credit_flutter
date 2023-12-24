import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import 'package:_88credit_flutter/features/domain/enums/loan_reason_types.dart';
import 'package:_88credit_flutter/features/domain/enums/post_type.dart';

import '../../../domain/entities/credit/user.dart';
import '../../../domain/enums/post_status.dart';

class PostModel extends PostEntity {
  const PostModel({
    super.id,
    super.user,
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
      user: json['user'] != null ? UserEntity.fromJson(json['user']) : null,
      type: json['type'] != null ? PostTypes.parse(json['type']) : null,
      loanReasonType: json['loan_reason_type'] != null
          ? LoanReasonTypes.parse(json['loan_reason_type'])
          : null,
      loanReason: json['loan_reason'],
      status: json['status'] != null ? PostStatus.parse(json['status']) : null,
      title: json['title'],
      description: json['description'],
      images: List<String>.from(json['images'] ?? []),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      interestRate: json['interest_rate'],
      loanAmount: double.parse(json['loan_amount']),
      tenureMonths: json['tenure_months'],
      overdueInterestRate: json['overdue_interest_rate'],
      maxInterestRate: json['max_interest_rate'],
      maxLoanAmount: json['max_loan_amount'] != null
          ? double.parse(json['max_loan_amount'])
          : null,
      maxTenureMonths: json['max_tenure_months'],
      maxOverdueInterestRate: json['max_overdue_interest_rate'],
      rejectedReason: json['rejected_reason'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toString(),
      'loan_reason_type': loanReasonType.toString(),
      'loan_reason': loanReason,
      'title': title,
      'description': description,
      'images': images,
      'interest_rate': interestRate,
      'loan_amount': loanAmount,
      'tenure_months': tenureMonths,
      'overdue_interest_rate': overdueInterestRate ?? 0.1,
      'max_interest_rate': maxInterestRate,
      'max_loan_amount': maxLoanAmount,
      'max_tenure_months': maxTenureMonths,
      'max_overdue_interest_rate': maxOverdueInterestRate,
    };
  }

  factory PostModel.fromEntity(PostEntity entity) {
    return PostModel(
      id: entity.id,
      user: entity.user,
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
