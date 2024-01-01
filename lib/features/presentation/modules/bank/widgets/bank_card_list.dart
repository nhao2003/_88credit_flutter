import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/core/utils/bank_format.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/text_styles.dart';
import '../../../../../config/values/asset_image.dart';

class BankCardList extends StatelessWidget {
  const BankCardList({required this.listBanks, super.key});

  final List<BankCardEntity> listBanks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listBanks.length,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          child: Card(
            elevation: 4,
            color: listBanks[index].isPrimary!
                ? const Color.fromARGB(195, 2, 109, 77)
                : AppColors.white,
            surfaceTintColor: Colors.transparent,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: CachedNetworkImage(
                  imageUrl: listBanks[index].bank!.logo,
                  fit: BoxFit.contain,
                  width: 70,
                  height: 50,
                  errorWidget: (context, _, __) {
                    return const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(Assets.avatar2),
                    );
                  },
                ),
              ),
              title: Text(
                listBanks[index].bank!.shortName,
                style: AppTextStyles.bold16,
              ),
              subtitle: Text(
                BankFormat.formatCardNumber(listBanks[index].cardNumber!),
                style: AppTextStyles.medium14.copyWith(
                    color: listBanks[index].isPrimary!
                        ? AppColors.white
                        : AppColors.grey400),
              ),
              trailing: listBanks[index].isPrimary!
                  ? const Icon(
                      Icons.check,
                      color: AppColors.white,
                    )
                  : null,
              onTap: () {
                // change card primary
              },
            ),
          ),
        );
      },
    );
  }
}
