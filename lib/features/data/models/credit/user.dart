import '../../../domain/entities/nhagiare/posts/address.dart';
import '../../../domain/entities/credit/user.dart';
import '../../../domain/enums/role.dart';
import '../../../domain/enums/user_status.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.status,
    super.isIdentityVerified,
    super.role,
    super.email,
    super.address,
    super.firstName,
    super.lastName,
    super.gender,
    super.avatar,
    super.dob,
    super.phone,
    super.lastActiveAt,
    super.createdAt,
    super.updatedAt,
    super.bannedUtil,
    super.banReason,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      //status: UserStatus.parse(json['status']),
      status: UserStatus.parse(json['status'] ?? ""),
      isIdentityVerified: json['is_identity_verified'],
      role: Role.parse(json['role']),
      email: json['email'],
      address: json['address'] != null
          ? AddressEntity.fromJson(json['address'])
          : null,
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      avatar: json['avatar'],
      dob: json['dob'],
      phone: json['phone'],
      banReason: json['ban_reason'],
      lastActiveAt: DateTime.parse(json['last_active_at']),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      bannedUtil: json['banned_util'] != null
          ? DateTime.tryParse(json['banned_util'] ?? "")
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status.toString(),
      'is_identity_verified': isIdentityVerified,
      'role': role.toString(),
      'email': email,
      'address': address,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'avatar': avatar,
      'dob': dob,
      'phone': phone,
      'ban_reason': banReason,
      'last_active_at': lastActiveAt!.toIso8601String(),
      'created_at': createdAt!.toIso8601String(),
      'updated_at': updatedAt!.toIso8601String(),
      'banned_util': bannedUtil!.toIso8601String(),
    };
  }
}
