import 'package:flutter/material.dart';
import '../../../../../config/values/asset_image.dart';
import '../../../../domain/entities/properties/motel.dart';
import '../../../../domain/enums/furniture_status.dart';
import 'details.dart';

class MotelCard extends StatelessWidget {
  const MotelCard({required this.feature, super.key});
  final Motel feature;

  @override
  Widget build(BuildContext context) {
    var keysList = [];
    List<String> exclude = [];
    feature.toJson().forEach((key, value) {
      if (value != null && !exclude.contains(key)) {
        keysList.add(key);
      }
    });
    Map<String, List<String>> featureMap = {
      "water_price": [
        "Giá nước",
        feature.waterPrice != null ? feature.waterPrice.toString() : "",
        Assets.leaf,
      ],
      "electric_price": [
        "Giá điện",
        feature.electricPrice != null ? feature.electricPrice.toString() : "",
        Assets.lightBulb,
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
        if (value[1] != "") {
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
