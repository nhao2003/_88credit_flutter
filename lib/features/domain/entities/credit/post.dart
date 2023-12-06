import 'package:equatable/equatable.dart';
import '../../enums/loan_reason_types.dart';
import '../../enums/post_status.dart';

class PostEntity extends Equatable {
  final String? id;
  final String? userId;
  final String? type;
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
    this.userId,
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
        userId,
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
    String? userId,
    String? type,
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
      userId: userId ?? this.userId,
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
}
