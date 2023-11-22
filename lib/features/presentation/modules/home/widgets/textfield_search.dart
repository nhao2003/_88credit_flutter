import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/text_styles.dart';
import '../../search/widgets/my_search_delegate.dart';
import '../home_controller.dart';

class TextFiedSearch extends StatelessWidget {
  TextFiedSearch({super.key});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: controller.searchFocusNode,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Tìm kiếm trên NHAGIARE'.tr,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.green,
            width: 0.0,
            style: BorderStyle.none,
          ),
        ),
      ),
      readOnly: true,
      style: AppTextStyles.regular16,
      controller: controller.textSearchController,
      onTap: () => controller.onTapSearch(context, MySearchDelegate()),
      onChanged: controller.onChangedTextFiled,
      onTapOutside: (event) {
        controller.searchFocusNode.unfocus();
      },
    );
  }
}
