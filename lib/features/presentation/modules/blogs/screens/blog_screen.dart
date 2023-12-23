import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/blogs/blog_controller.dart';
import 'package:_88credit_flutter/features/presentation/modules/blogs/screens/blog_detail_screen.dart';

import '../../../../domain/entities/nhagiare/blog/blog.dart';

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  late final BlogController _controller;

  @override
  void initState() {
    _controller = Get.put(BlogController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: 'Blogs',
      ),
      body: FutureBuilder<List<BlogEntity>>(
          future: _controller.getBlogs(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            RxList<BlogEntity> data = snapshot.data!.obs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => BlogDetailScreen(), arguments: data[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: CachedNetworkImage(
                              imageUrl: data[index].thumbnail,
                              fit: BoxFit.cover,
                              height: 23.hp,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].shortDescription,
                                  style: AppTextStyles.bold16,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  data[index].shortDescription,
                                  style: AppTextStyles.light12
                                      .colorEx(AppColors.grey500),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Row(
                                //   children: [
                                //     const Icon(
                                //       Icons.remove_red_eye_outlined,
                                //       color: AppColors.grey500,
                                //       size: 15,
                                //     ),
                                //     const SizedBox(
                                //       width: 3,
                                //     ),
                                //     Obx(() => Text(
                                //           "${data[index].numViews} lượt xem",
                                //           style: AppTextStyles.light12.copyWith(
                                //               color: AppColors.grey500),
                                //         )),
                                //   ],
                                // ),
                                // const SizedBox(height: 4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
