import 'package:_88credit_flutter/features/domain/entities/credit/contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../../core/resources/pair.dart';

class BaseListContract extends StatefulWidget {
  final Future<Pair<int, List<ContractEntity>>> Function({int? page})
      getRequest;
  final RxList<ContractEntity> requestsList;
  final Widget? Function(ContractEntity post) buildItem;
  final String titleNull;
  const BaseListContract(
      {required this.getRequest,
      required this.requestsList,
      required this.buildItem,
      this.titleNull = "Chưa có hợp đồng nào",
      super.key});

  @override
  State<BaseListContract> createState() => _BaseListContractState();
}

class _BaseListContractState extends State<BaseListContract> {
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
    if (page < numOfPage) {
      // Fetch more data and add to the list
      await widget.getRequest(page: page).then((value) {
        numOfPage = value.first;
        final newPosts = value.second;
        widget.requestsList.addAll(newPosts);
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
    await widget.getRequest().then((value) {
      numOfPage = value.first;
      widget.requestsList.value = value.second;
      numOfPage == 1 ? hasMore.value = false : hasMore.value = true;
    });
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: Obx(
        () => isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : widget.requestsList.isEmpty
                ? Center(
                    child: Text(
                      widget.titleNull,
                      style:
                          AppTextStyles.bold20.copyWith(color: AppColors.green),
                    ),
                  )
                : ListView.builder(
                    controller: scrollController,
                    itemCount: widget.requestsList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < widget.requestsList.length) {
                        return widget.buildItem(widget.requestsList[index]);
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
    );
  }
}
