import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/domain/enums/apartment_types.dart';
import 'package:_88credit_flutter/features/domain/enums/direction.dart';
import 'package:_88credit_flutter/features/domain/enums/legal_document_status.dart';

import '../../../../../config/values/asset_image.dart';
import '../../../../domain/entities/nhagiare/properties/apartment.dart';
import '../../../../domain/enums/furniture_status.dart';
import 'details.dart';

class ApartmentCard extends StatelessWidget {
  const ApartmentCard({required this.feature, super.key});
  final Apartment feature;

  @override
  Widget build(BuildContext context) {
    var keysList = [];
    List<String> exclude = ["show_apartment_number"];
    feature.toJson().forEach((key, value) {
      if (value != null && !exclude.contains(key)) {
        keysList.add(key);
      }
    });
    Map<String, List<String>> featureMap = {
      "apartment_type": [
        "Loại hình căn hộ",
        feature.apartmentType != null
            ? ApartmentTypes.getStringVi(feature.apartmentType!)
            : "",
        Assets.home,
      ],
      "is_hand_over": [
        "Tình trạng",
        feature.isHandOver.toString(),
        Assets.tag,
      ],
      "num_of_bed_rooms": [
        "Số phòng ngủ",
        feature.numOfBedRooms.toString(),
        Assets.key,
      ],
      "furniture_status": [
        "Tình trạng nội thất",
        feature.furnitureStatus != null
            ? FurnitureStatus.getStringVi(feature.furnitureStatus!)
            : "",
        Assets.archive,
      ],
      "num_of_toilets": [
        "Số phòng vệ sinh",
        feature.numOfToilets.toString(),
        Assets.inboxIn,
      ],
      "balcony_direction": [
        "Hướng ban công",
        feature.balconyDirection != null
            ? Direction.getStringVi(feature.balconyDirection!)
            : "",
        Assets.arrowsExpand,
      ],
      "block": [
        "Tòa",
        feature.block.toString(),
        Assets.office,
      ],
      "floor": [
        "Tầng",
        feature.floor.toString(),
        Assets.office,
      ],
      "legal_document_status": [
        "Giấy tờ pháp lý",
        feature.legalDocumentStatus != null
            ? LegalDocumentStatus.getStringVi(feature.legalDocumentStatus!)
            : "",
        Assets.clipboard,
      ],
      "apartment_number": [
        "Số căn hộ",
        feature.apartmentNumber.toString(),
        Assets.home,
      ],
    };

    List<Widget> buildFeatureWidget() {
      List<Widget> list = [];
      featureMap.forEach((key, value) {
        if (key == "apartment_number" && feature.showApartmentNumber == false) {
        } else if (value[1] != "") {
          list.add(
            Detail(
              iconAsset: value[2],
              title: value[0],
              value: value[1],
            ),
          );
        }
      });
      return list;
    }

    return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 4,
        crossAxisCount: 2,
        shrinkWrap: true,
        children: buildFeatureWidget());
  }
}
