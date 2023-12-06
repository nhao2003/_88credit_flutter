import 'package:flutter/material.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/presentation/modules/user_profile/user_profile_controller.dart';

import '../../../../domain/entities/nhagiare/posts/real_estate_post.dart';
import '../../../global_widgets/infor_card.dart';

class UserPosts extends StatelessWidget {
  UserPosts({super.key});
  final UserProfileController controller = UserProfileController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: FutureBuilder<List<RealEstatePostEntity>>(
        future: controller.getAllPosts(),
        builder: (context, snapShot) {
          if (!snapShot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<RealEstatePostEntity> data = snapShot.data!;
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 28.hp,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              shrinkWrap: false,
              children: data
                  .map((post) => InkWell(
                        child: InforCard(
                          key: UniqueKey(),
                          post: post,
                          width: 50.wp,
                        ),
                      ))
                  .toList(),
            );
            // return ListView.separated(
            //   shrinkWrap: true,
            //   itemCount: data.length,
            //   scrollDirection: Axis.horizontal,
            //   separatorBuilder: (BuildContext context, int index) =>
            //       const SizedBox(
            //     width: 10,
            //   ),
            //   itemBuilder: (BuildContext context, int index) {
            //     return InkWell(
            //       child: InforCard(key: UniqueKey(), post: data[index]),
            //     );
            //   },
            // );
          }
        },
      ),
    );
  }
}
