import 'package:flutter/material.dart';
import 'package:_88credit_flutter/core/extensions/bool_ex.dart';
import '../../../../../config/values/asset_image.dart';
import '../../../../domain/entities/nhagiare/properties/house.dart';
import '../../../../domain/enums/direction.dart';
import '../../../../domain/enums/furniture_status.dart';
import '../../../../domain/enums/house_types.dart';
import '../../../../domain/enums/legal_document_status.dart';
import 'details.dart';

class HouseCard extends StatelessWidget {
  const HouseCard({required this.feature, super.key});
  final House feature;

  @override
  Widget build(BuildContext context) {
    var keysList = [];
    List<String> exclude = ["show_house_number"];
    feature.toJson().forEach((key, value) {
      if (value != null && !exclude.contains(key)) {
        keysList.add(key);
      }
    });
    Map<String, List<String>> featureMap = {
      "house_type": [
        "Loại hình nhà ở",
        feature.houseType != null
            ? HouseTypes.getStringVi(feature.houseType!)
            : "",
        Assets.home,
      ],
      "num_of_bed_rooms": [
        "Số phòng ngủ",
        feature.numOfBedRooms != null ? feature.numOfBedRooms!.toString() : "",
        Assets.key,
      ],
      "is_widens_towards_the_back": [
        "Mở rộng về phía sau",
        feature.isWidensTowardsTheBack != null
            ? feature.isWidensTowardsTheBack!.getStringVi()
            : "",
        Assets.collection,
      ],
      "num_of_toilets": [
        "Số phòng vệ sinh",
        feature.numOfToilets != null ? feature.numOfToilets!.toString() : "",
        Assets.inboxIn,
      ],
      "num_of_floors": [
        "Số tầng",
        feature.numOfFloors != null ? feature.numOfFloors!.toString() : "",
        Assets.office,
      ],
      "main_door_direction": [
        "Hướng cửa chính",
        feature.mainDoorDirection != null
            ? Direction.getStringVi(feature.mainDoorDirection!.toString())
            : "",
        Assets.arrowsExpand,
      ],
      "width": [
        "Chiều dài",
        feature.width != null ? feature.width.toString() : "",
        Assets.colorSwatch,
      ],
      "length": [
        "Chiều rộng",
        feature.length != null ? feature.length.toString() : "",
        Assets.colorSwatch,
      ],
      "area_used": [
        "Diện tích đất sử dụng",
        feature.areaUsed != null ? feature.areaUsed.toString() : "",
        Assets.map,
      ],
      "legal_document_status": [
        "Giấy tờ pháp lý",
        feature.legalDocumentStatus != null
            ? LegalDocumentStatus.getStringVi(feature.legalDocumentStatus!)
            : "",
        Assets.clipboard,
      ],
      "house_number": [
        "Số nhà",
        feature.houseNumber != null ? feature.houseNumber.toString() : "",
        Assets.home,
      ],
      "furniture_status": [
        "Tình trạng nội thất",
        feature.furnitureStatus != null
            ? FurnitureStatus.getStringVi(feature.furnitureStatus!)
            : "",
        Assets.archive,
      ],
    };

    List<Widget> buildFeatureWidget() {
      List<Widget> list = [];
      featureMap.forEach((key, value) {
        if (key == "house_number" && feature.showHouseNumber == false) {
        } else if (value[1] != "") {
          list.add(Detail(
            iconAsset: value[2],
            title: value[0],
            value: value[1],
          ));
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
