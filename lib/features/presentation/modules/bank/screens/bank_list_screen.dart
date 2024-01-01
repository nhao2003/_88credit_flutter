import 'package:_88credit_flutter/config/routes/app_routes.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/features/domain/entities/credit/bank.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/bank/bank_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/values/asset_image.dart';
import '../../../../../core/resources/pair.dart';

class BankListScreen extends StatefulWidget {
  const BankListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BankListScreenState createState() => _BankListScreenState();
}

class _BankListScreenState extends State<BankListScreen> {
  RxList<BankEntity> listBanks = RxList<BankEntity>([]);
  int currentPage = 1;
  int maxPages = 1; // Set your maximum number of pages
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();
  RxString searchQuery = "".obs;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    loadMoreData();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> loadMoreData() async {
    if (!isLoading && currentPage <= maxPages) {
      setState(() {
        isLoading = true;
      });

      Pair<int, List<BankEntity>> newData = await getListBanks(currentPage);
      maxPages = newData.first;
      listBanks.addAll(newData.second);

      setState(() {
        isLoading = false;
        currentPage++;
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200.0) {
      loadMoreData();
    }
  }

  final BankController bankController = Get.find();
  Future<Pair<int, List<BankEntity>>> getListBanks(int page) async {
    assert(page >= 1);
    final data = await bankController.searchBank(searchQuery.value, page);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Lựa chọn ngân hàng"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => searchQuery.value = value,
              onSubmitted: (value) {
                listBanks.clear();
                currentPage = 1;
                loadMoreData();
              },
              decoration: InputDecoration(
                hintText: "Tìm kiếm",
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels >=
                        scrollInfo.metrics.maxScrollExtent - 200.0) {
                  loadMoreData();
                }
                return false;
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: listBanks.length + (isLoading ? 1 : 0),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  if (index < listBanks.length) {
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.grey200,
                            width: 1,
                          ),
                        ),
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 5),
                        leading: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: CachedNetworkImage(
                            imageUrl: listBanks[index].logo,
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
                          listBanks[index].shortName,
                          style: AppTextStyles.bold16,
                        ),
                        subtitle: Text(
                          listBanks[index].name,
                          style: AppTextStyles.medium14
                              .copyWith(color: AppColors.grey400),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onTap: () {
                          bankController.selectedBank = listBanks[index];
                          Get.toNamed(AppRoutes.addBankCard);
                        },
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
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
