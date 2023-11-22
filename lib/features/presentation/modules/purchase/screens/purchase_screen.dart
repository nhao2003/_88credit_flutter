import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/core/extensions/double_ex.dart';
import 'package:_88credit_flutter/features/domain/entities/purchase/membership_package.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/purchase/widgets/package_card.dart';
import '../../../../../config/theme/app_color.dart';
import '../purchase_controller.dart';

class PurchaseScreen extends StatelessWidget {
  PurchaseScreen({super.key});

  final PurchaseController controller = Get.find<PurchaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: MyAppbar(
        actions: [
          IconButton(
            onPressed: () {
              // Get.to(PurchaseHistoryScreen());
            },
            icon: const Icon(Icons.history),
          )
        ],
        title: 'Gói dịch vụ',
      ),
      body: FutureBuilder<List<MembershipPackageEntity>>(
          future: controller.getMembershipPackages(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 50.0.hp,
                    width: double.infinity,
                    foregroundDecoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.7),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/200/300?random=1",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Nhà giá rẻ",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        const Text(
                          "Giải pháp chuyên nghiệp dành cho các nhà Môi giới Bất động sản",
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                        const Text(
                          "Tiết kiệm - Tiện lợi - Hiệu quả",
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ...snapshot.data!
                            .map((e) => Container(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  width: double.infinity,
                                  child: MembershipPackageCard(
                                    package: e,
                                    onTapBuy: (package) {
                                      Get.toNamed(AppRoutes.purchaseChoosePlan,
                                          arguments: package);
                                    },
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
