import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/features/presentation/modules/search/search_controller.dart';

import '../../../../../../config/theme/text_styles.dart';

class DropdownButtonCities extends StatefulWidget {
  const DropdownButtonCities({super.key});

  @override
  State<DropdownButtonCities> createState() => _DropdownButtonCitiesState();
}

class _DropdownButtonCitiesState extends State<DropdownButtonCities> {
  final MySearchController searchController = Get.find<MySearchController>();
  late List<DropdownMenuItem<String>> dropDownMenuItems;

  @override
  void initState() {
    searchController.getProvinceNames();
    searchController.changeSelectedItem(searchController.provinceNames[0]);
    dropDownMenuItems = searchController.provinceNames
        .map(
          (String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style:
                    AppTextStyles.regular14.copyWith(color: AppColors.black)),
          ),
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          value: searchController.selectedTypeItem!.value,
          style: AppTextStyles.regular14.copyWith(color: AppColors.black),
          onChanged: (String? newValue) {
            if (newValue != null) {
              searchController.changeSelectedItem(newValue);
            }
          },
          items: dropDownMenuItems,
          buttonStyleData: const ButtonStyleData(
            height: 40,
            width: 160,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 400,
          ),
        ),
      ),
    );
  }
}
