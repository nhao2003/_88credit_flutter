import 'package:equatable/equatable.dart';
import 'package:_88credit_flutter/features/domain/enums/role.dart';
import 'package:_88credit_flutter/features/domain/enums/user_status.dart';
import '../nhagiare/posts/address.dart';

class UserEntity extends Equatable {
  final String? id;
  final UserStatus? status;
  final bool? isIdentityVerified;
  final Role? role;
  final String? email;
  final AddressEntity? address;
  final String? firstName;
  final String? lastName;
  final bool? gender;
  final String? avatar;
  final String? dob;
  final String? phone;
  final DateTime? lastActiveAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? bannedUtil;
  final String? banReason;

  String get fullName => "$firstName $lastName";

  const UserEntity({
    this.id,
    this.status,
    this.isIdentityVerified,
    this.role,
    this.email,
    this.address,
    this.firstName,
    this.lastName,
    this.gender,
    this.avatar,
    this.dob,
    this.phone,
    this.banReason,
    this.lastActiveAt,
    this.createdAt,
    this.updatedAt,
    this.bannedUtil,
  });

  @override
  List<Object?> get props => [id];

  UserEntity copyWith({
    String? id,
    UserStatus? status,
    bool? isIdentityVerified,
    Role? role,
    String? email,
    AddressEntity? address,
    String? firstName,
    String? lastName,
    bool? gender,
    String? avatar,
    String? dob,
    String? phone,
    String? banReason,
    DateTime? lastActiveAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? bannedUtil,
  }) {
    return UserEntity(
      id: id ?? this.id,
      status: status ?? this.status,
      isIdentityVerified: isIdentityVerified ?? this.isIdentityVerified,
      role: role ?? this.role,
      email: email ?? this.email,
      address: address ?? this.address,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      avatar: avatar ?? this.avatar,
      dob: dob ?? this.dob,
      phone: phone ?? this.phone,
      banReason: banReason ?? this.banReason,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      bannedUtil: bannedUtil ?? this.bannedUtil,
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      status: UserStatus.parse(json['status'] ?? ""),
      isIdentityVerified: json['is_identity_verified'] ?? false,
      role: Role.parse(json['role'] ?? ""),
      email: json['email'] ?? "",
      address: AddressEntity.fromJson(json['address'] ?? {}),
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      gender: json['gender'] ?? false,
      avatar: json['avatar'] ?? "",
      dob: json['dob'] ?? "",
      phone: json['phone'] ?? "",
      banReason: json['ban_reason'] ?? "",
      lastActiveAt: DateTime.parse(json['last_active_at'] ?? ""),
      createdAt: DateTime.parse(json['created_at'] ?? ""),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
      bannedUtil: DateTime.tryParse(json['banned_util'] ?? ""),
    );
  }

  String? getFullName() {
    if (firstName == "" || lastName == "") {
      return null;
    }
    return "$firstName $lastName";
  }
}
