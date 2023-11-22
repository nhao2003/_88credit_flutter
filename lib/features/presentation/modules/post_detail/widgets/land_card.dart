import 'package:flutter/material.dart';
import 'package:_88credit_flutter/core/extensions/bool_ex.dart';
import '../../../../../config/values/asset_image.dart';
import '../../../../domain/entities/properties/land.dart';
import '../../../../domain/enums/direction.dart';
import '../../../../domain/enums/land_types.dart';
import '../../../../domain/enums/legal_document_status.dart';
import 'details.dart';

class LandCard extends StatelessWidget {
  const LandCard({required this.feature, super.key});
  final Land feature;

  @override
  Widget build(BuildContext context) {
    var keysList = [];
    List<String> exclude = ["show_land_lot_code"];
    feature.toJson().forEach((key, value) {
      if (value != null && !exclude.contains(key)) {
        keysList.add(key);
      }
    });
    Map<String, List<String>> featureMap = {
      "land_type": [
        "Loại hình đất",
        feature.landType != null
            ? LandTypes.getStringVi(feature.landType!)
            : "",
        Assets.home,
      ],
      "land_lot_code": [
        "Mã lô đất",
        feature.landLotCode != null ? feature.landLotCode.toString() : "",
        Assets.tag,
      ],
      "subdivision_name": [
        "Tên khu đất",
        feature.subdivisionName != null
            ? feature.subdivisionName.toString()
            : "",
        Assets.key,
      ],
      "is_facade": [
        "Mặt tiền",
        feature.isFacade != null ? feature.isFacade!.getStringVi() : "",
        Assets.archive,
      ],
      "has_wide_alley": [
        "Có hẻm rộng",
        feature.hasWideAlley != null ? feature.hasWideAlley!.getStringVi() : "",
        Assets.inboxIn,
      ],
      "is_widens_towards_the_back": [
        "Mở rộng về phía sau",
        feature.isWidensTowardsTheBack != null
            ? feature.isWidensTowardsTheBack!.getStringVi()
            : "",
        Assets.arrowsExpand,
      ],
      "land_direction": [
        "Hướng đất",
        feature.landDirection != null
            ? Direction.getStringVi(feature.landDirection!.toString())
            : "",
        Assets.arrowsExpand,
      ],
      "legal_document_status": [
        "Giấy tờ pháp lý",
        feature.legalDocumentStatus != null
            ? LegalDocumentStatus.getStringVi(feature.legalDocumentStatus!)
            : "",
        Assets.clipboard,
      ]
    };

    List<Widget> buildFeatureWidget() {
      List<Widget> list = [];
      featureMap.forEach((key, value) {
        if (key == "land_lot_code" && feature.showLandLotCode == false) {
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
