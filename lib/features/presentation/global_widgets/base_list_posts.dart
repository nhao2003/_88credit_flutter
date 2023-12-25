import 'package:_88credit_flutter/features/domain/entities/credit/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/theme/app_color.dart';
import '../../../config/theme/text_styles.dart';
import '../../../core/resources/pair.dart';

class BaseListPosts extends StatefulWidget {
  final Future<Pair<int, List<PostEntity>>> Function({int? page}) getPosts;
  final RxList<PostEntity> postsList;
  final Widget? Function(PostEntity post) buildItem;
  final String titleNull;
  final Widget? cardSort;
  const BaseListPosts(
      {required this.getPosts,
      required this.postsList,
      required this.buildItem,
      this.cardSort,
      this.titleNull = "Chưa có tin đã đăng",
      super.key});

  @override
  State<BaseListPosts> createState() => _BaseListPostsState();
}

class _BaseListPostsState extends State<BaseListPosts> {
  RxBool isLoading = false.obs;
  int page = 1;
  int numOfPage = 1;
  final scrollController = ScrollController();
  RxBool hasMore = true.obs;

  @override
  void initState() {
    refresh();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        fetchMore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future fetchMore() async {
    page++;
    if (page <= numOfPage) {
      // Fetch more data and add to the list
      await widget.getPosts(page: page).then((value) {
        numOfPage = value.first;
        final newPosts = value.second;
        widget.postsList.addAll(newPosts);
        hasMore.value = true;
      });
    } else {
      // No more pages to fetch
      hasMore.value = false;
    }
  }

  Future refresh() async {
    isLoading.value = true;
    page = 1;
    hasMore.value = true;
    await widget.getPosts().then((value) {
      numOfPage = value.first;
      widget.postsList.value = value.second;
      numOfPage == 1 ? hasMore.value = false : hasMore.value = true;
    });
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: Column(
        children: [
          widget.cardSort != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: widget.cardSort,
                )
              : const SizedBox(),
          Expanded(
            child: Obx(
              () => isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : widget.postsList.isEmpty
                      ? Center(
                          child: Text(
                            widget.titleNull,
                            style: AppTextStyles.bold20
                                .copyWith(color: AppColors.green),
                          ),
                        )
                      : ListView.builder(
                          controller: scrollController,
                          itemCount: widget.postsList.length + 1,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            if (index < widget.postsList.length) {
                              return widget.buildItem(widget.postsList[index]);
                            } else {
                              return Obx(
                                () => hasMore.value
                                    ? const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : const SizedBox(height: 20),
                              );
                            }
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
