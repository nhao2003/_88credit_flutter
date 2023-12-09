import 'package:_88credit_flutter/features/domain/entities/credit/user.dart';
import 'package:_88credit_flutter/features/domain/enums/post_type.dart';
import 'package:equatable/equatable.dart';
import '../../enums/loan_reason_types.dart';
import '../../enums/post_status.dart';

class PostEntity extends Equatable {
  final String? id;
  final UserEntity? user;
  final PostTypes? type;
  final LoanReasonTypes? loanReasonType;
  final String? loanReason;
  final PostStatus? status;
  final String? title;
  final String? description;
  final List<String>? images;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? interestRate;
  final double? loanAmount;
  final int? tenureMonths;
  final double? overdueInterestRate;
  final double? maxInterestRate;
  final double? maxLoanAmount;
  final int? maxTenureMonths;
  final double? maxOverdueInterestRate;
  final String? rejectedReason;
  final DateTime? deletedAt;

  const PostEntity({
    this.id,
    this.user,
    this.type,
    this.loanReasonType,
    this.loanReason,
    this.status,
    this.title,
    this.description,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.interestRate,
    this.loanAmount,
    this.tenureMonths,
    this.overdueInterestRate,
    this.maxInterestRate,
    this.maxLoanAmount,
    this.maxTenureMonths,
    this.maxOverdueInterestRate,
    this.rejectedReason,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        user,
        type,
        loanReasonType,
        loanReason,
        status,
        title,
        description,
        images,
        createdAt,
        updatedAt,
        interestRate,
        loanAmount,
        tenureMonths,
        overdueInterestRate,
        maxInterestRate,
        maxLoanAmount,
        maxTenureMonths,
        maxOverdueInterestRate,
        rejectedReason,
        deletedAt,
      ];

  PostEntity copyWith({
    String? id,
    UserEntity? user,
    PostTypes? type,
    LoanReasonTypes? loanReasonType,
    String? loanReason,
    PostStatus? status,
    String? title,
    String? description,
    List<String>? images,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? interestRate,
    double? loanAmount,
    int? tenureMonths,
    double? overdueInterestRate,
    double? maxInterestRate,
    double? maxLoanAmount,
    int? maxTenureMonths,
    double? maxOverdueInterestRate,
    String? rejectedReason,
    DateTime? deletedAt,
  }) {
    return PostEntity(
      id: id ?? this.id,
      user: user ?? this.user,
      type: type ?? this.type,
      loanReasonType: loanReasonType ?? this.loanReasonType,
      loanReason: loanReason ?? this.loanReason,
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      interestRate: interestRate ?? this.interestRate,
      loanAmount: loanAmount ?? this.loanAmount,
      tenureMonths: tenureMonths ?? this.tenureMonths,
      overdueInterestRate: overdueInterestRate ?? this.overdueInterestRate,
      maxInterestRate: maxInterestRate ?? this.maxInterestRate,
      maxLoanAmount: maxLoanAmount ?? this.maxLoanAmount,
      maxTenureMonths: maxTenureMonths ?? this.maxTenureMonths,
      maxOverdueInterestRate:
          maxOverdueInterestRate ?? this.maxOverdueInterestRate,
      rejectedReason: rejectedReason ?? this.rejectedReason,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  // from json
  factory PostEntity.fromJson(Map<String, dynamic> json) {
    return PostEntity(
      id: json['post_id'] as String?,
      user: json['user'] != null ? UserEntity.fromJson(json['user']) : null,
      type: json['type'] != null ? PostTypes.parse(json['type']) : null,
      loanReasonType: json['post_loan_reason_type'] != null
          ? LoanReasonTypes.values.firstWhere(
              (element) => element.toString() == json['post_loan_reason_type'])
          : null,
      loanReason: json['post_loan_reason'] as String?,
      status: json['post_status'] != null
          ? PostStatus.values.firstWhere(
              (element) => element.toString() == json['post_status'])
          : null,
      title: json['post_title'] as String?,
      description: json['post_description'] as String?,
      images: json['post_images'] != null
          ? List<String>.from(json['post_images'])
          : null,
      createdAt: json['post_created_at'] != null
          ? DateTime.parse(json['post_created_at'] as String)
          : null,
      updatedAt: json['post_updated_at'] != null
          ? DateTime.parse(json['post_updated_at'] as String)
          : null,
      interestRate: json['post_interest_rate'] as double?,
      loanAmount: json['post_loan_amount'] as double?,
      tenureMonths: json['post_tenure_months'] as int?,
      overdueInterestRate: json['post_overdue_interest_rate'] as double?,
      maxInterestRate: json['post_max_interest_rate'] as double?,
      maxLoanAmount: json['post_max_loan_amount'] as double?,
      maxTenureMonths: json['post_max_tenure_months'] as int?,
      maxOverdueInterestRate: json['post_max_overdue_interest_rate'] as double?,
      rejectedReason: json['post_rejected_reason'] as String?,
      deletedAt: json['post_deleted_at'] != null
          ? DateTime.parse(json['post_deleted_at'] as String)
          : null,
    );
  }
}
