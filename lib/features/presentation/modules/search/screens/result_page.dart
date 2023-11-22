import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/features/presentation/modules/search/search_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/search/widgets/result_page/tab_result.dart';

import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../widgets/result_page/dropdownbutton_cities.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key});
  final MySearchController searchController = Get.find<MySearchController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // khu vuc toan quoc + loc
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // khu vuc toan quoc
              SizedBox(
                child: Row(
                  children: [
                    // icon + khu vuc toan quoc
                    const Icon(Icons.location_on_outlined),
                    const SizedBox(width: 5),
                    Text(
                      "Khu Vực",
                      style: AppTextStyles.regular14
                          .copyWith(color: AppColors.black),
                    ),
                    const SizedBox(width: 3),
                    // dropdown button
                    const DropdownButtonCities(),
                  ],
                ),
              ),
              // button filter
              OutlinedButton.icon(
                onPressed: () {
                  // filter here
                  //searchController.navigateToFilterScreen();
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.filter_alt_outlined,
                  color: AppColors.black,
                ),
                label: Text(
                  "Lọc",
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        // tab : Lien quan - tin moi nhat
        const TabResult(),
      ],
    );
  }
}
