import 'package:flutter/material.dart';
import 'package:_88credit_flutter/core/extensions/bool_ex.dart';
import 'package:_88credit_flutter/features/domain/entities/properties/office.dart';

import '../../../../../config/values/asset_image.dart';
import '../../../../domain/enums/direction.dart';
import '../../../../domain/enums/furniture_status.dart';
import '../../../../domain/enums/legal_document_status.dart';
import '../../../../domain/enums/office_types.dart';
import 'details.dart';

class OfficeCard extends StatelessWidget {
  const OfficeCard({required this.feature, super.key});
  final Office feature;

  @override
  Widget build(BuildContext context) {
    var keysList = [];
    List<String> exclude = ["show_office_number"];
    feature.toJson().forEach((key, value) {
      if (value != null && !exclude.contains(key)) {
        keysList.add(key);
      }
    });
    Map<String, List<String>> featureMap = {
      "land_type": [
        "Loại hình văn phòng",
        feature.officeType != null
            ? OfficeTypes.getStringVi(feature.officeType!)
            : "",
        Assets.home,
      ],
      "is_facade": [
        "Mặt tiền",
        feature.isFacade != null ? feature.isFacade!.getStringVi() : "",
        Assets.archive,
      ],
      "land_direction": [
        "Hướng cửa chính",
        feature.mainDoorDirection != null
            ? Direction.getStringVi(feature.mainDoorDirection!.toString())
            : "",
        Assets.arrowsExpand,
      ],
      "block": [
        "Tòa",
        feature.block != null ? feature.block.toString() : "",
        Assets.office,
      ],
      "floor": [
        "Tầng",
        feature.floor != null ? feature.floor.toString() : "",
        Assets.office,
      ],
      "legal_document_status": [
        "Giấy tờ pháp lý",
        feature.legalDocumentStatus != null
            ? LegalDocumentStatus.getStringVi(feature.legalDocumentStatus!)
            : "",
        Assets.clipboard,
      ],
      "office_number": [
        "Mã văn phòng",
        feature.officeNumber != null ? feature.officeNumber.toString() : "",
        Assets.tag,
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
        if (key == "office_number" && feature.showOfficeNumber == false) {
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
