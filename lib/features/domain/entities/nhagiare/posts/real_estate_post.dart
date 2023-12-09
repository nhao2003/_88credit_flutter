import 'dart:math';
import 'package:_88credit_flutter/features/domain/entities/nhagiare/posts/address.dart';
import 'package:equatable/equatable.dart';
import '../../../enums/post_status.dart';
import '../../credit/user.dart';

class RealEstatePostEntity extends Equatable {
  final String? id;
  final String? userId;
  final String? projectId;
  final String? typeId;
  final String? unitId;
  final PostStatus? status;
  final String? title;
  final String? description;
  final double? area;
  final AddressEntity? address;
  final Point? addressPoint;
  final String? price;
  final int? deposit;
  final bool? isLease;
  final DateTime? postedDate;
  final DateTime? expiryDate;
  final List<String>? images;
  final List<String>? videos;
  final bool? isProSeller;
  final String? infoMessage;
  final int? displayPriorityPoint;
  final Map<String, dynamic>? features;
  final int? postApprovalPriorityPoint;
  final int? updateCount;
  final bool? isActive;
  final int? numFavourites;
  final int? numViews;
  final bool? isFavorite;
  final UserEntity? user;

  const RealEstatePostEntity({
    this.id,
    this.userId,
    this.projectId,
    this.typeId,
    this.unitId,
    this.status,
    this.title,
    this.description,
    this.area,
    this.address,
    this.addressPoint,
    this.price,
    this.deposit,
    this.isLease,
    this.postedDate,
    this.expiryDate,
    this.images,
    this.videos,
    this.isProSeller,
    this.features,
    this.postApprovalPriorityPoint,
    this.isActive,
    this.infoMessage,
    this.updateCount,
    this.displayPriorityPoint,
    this.isFavorite,
    this.numFavourites,
    this.numViews,
    this.user,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        projectId,
        typeId,
        unitId,
        status,
        title,
        description,
        area,
        address,
        addressPoint,
        price,
        deposit,
        isLease,
        postedDate,
        expiryDate,
        images,
        videos,
        isProSeller,
        features,
        postApprovalPriorityPoint,
        isActive,
        infoMessage,
        updateCount,
        displayPriorityPoint,
        isFavorite,
        numFavourites,
        numViews,
        user,
      ];

  RealEstatePostEntity copyWith({
    String? id,
    String? userId,
    String? projectId,
    String? typeId,
    String? unitId,
    PostStatus? status,
    String? title,
    String? description,
    double? area,
    AddressEntity? address,
    Point? addressPoint,
    String? price,
    int? deposit,
    bool? isLease,
    DateTime? postedDate,
    DateTime? expiryDate,
    List<String>? images,
    List<String>? videos,
    bool? isProSeller,
    Map<String, dynamic>? features,
    int? postApprovalPriorityPoint,
    bool? isActive,
    String? infoMessage,
    int? updateCount,
    int? displayPriorityPoint,
    int? numFavourites,
    int? numViews,
    bool? isFavorite,
    UserEntity? user,
  }) {
    return RealEstatePostEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      projectId: projectId ?? this.projectId,
      typeId: typeId ?? this.typeId,
      unitId: unitId ?? this.unitId,
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
      area: area ?? this.area,
      address: address ?? this.address,
      addressPoint: addressPoint ?? this.addressPoint,
      price: price ?? this.price,
      deposit: deposit ?? this.deposit,
      isLease: isLease ?? this.isLease,
      postedDate: postedDate ?? this.postedDate,
      expiryDate: expiryDate ?? this.expiryDate,
      images: images ?? this.images,
      videos: videos ?? this.videos,
      isProSeller: isProSeller ?? this.isProSeller,
      features: features ?? this.features,
      postApprovalPriorityPoint:
          postApprovalPriorityPoint ?? this.postApprovalPriorityPoint,
      isActive: isActive ?? this.isActive,
      infoMessage: infoMessage ?? this.infoMessage,
      updateCount: updateCount ?? this.updateCount,
      displayPriorityPoint: displayPriorityPoint ?? this.displayPriorityPoint,
      numFavourites: numFavourites ?? this.numFavourites,
      numViews: numViews ?? this.numViews,
      isFavorite: isFavorite ?? this.isFavorite,
      user: user ?? this.user,
    );
  }
}
