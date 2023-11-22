import '../../../domain/entities/posts/address.dart';
import '../../../domain/entities/user/user.dart';
import '../../../domain/enums/role.dart';
import '../../../domain/enums/user_status.dart';

class UserModel extends UserEntity {
  const UserModel({
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
    DateTime? lastActiveAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? bannedUtil,
    String? banReason,
  }) : super(
          id: id,
          status: status,
          isIdentityVerified: isIdentityVerified,
          role: role,
          email: email,
          address: address,
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          avatar: avatar,
          dob: dob,
          phone: phone,
          banReason: banReason,
          lastActiveAt: lastActiveAt,
          createdAt: createdAt,
          updatedAt: updatedAt,
          bannedUtil: bannedUtil,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      //status: UserStatus.parse(json['status']),
      status: null,
      isIdentityVerified: json['is_identity_verified'],
      role: Role.parse(json['role']),
      email: json['email'],
      address: AddressEntity.fromJson(json['address']),
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      avatar: json['avatar'],
      dob: json['dob'],
      phone: json['phone'],
      banReason: json['ban_reason'],
      lastActiveAt: DateTime.parse(json['last_active_at']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      bannedUtil: DateTime.tryParse(json['banned_util'] ?? ""),
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
