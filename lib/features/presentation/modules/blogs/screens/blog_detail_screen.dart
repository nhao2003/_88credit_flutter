import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/date_ex.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/blogs/blog_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/nhagiare/blog/blog.dart';

class BlogDetailScreen extends StatelessWidget {
  final BlogController controller = Get.put(BlogController());
  BlogDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlogEntity blog = Get.arguments;
    return Scaffold(
        appBar: MyAppbar(title: "Chi tiết bài viết"),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: AppTextStyles.bold24.copyWith(color: AppColors.green),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  blog.shortDescription,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      blog.author,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.watch_later_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(blog.createdAt.getTimeAgoVi())
                  ],
                ),
                FutureBuilder(
                  future: Future.delayed(const Duration(microseconds: 500)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Html(
                        data: blog.content,
                        onLinkTap: (url, attributes, element) async {
                          await launchUrl(
                            Uri.parse(url!),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
