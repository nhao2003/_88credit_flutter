import 'package:_88credit_flutter/features/domain/entities/credit/user.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/create_request/create_request_controler.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/values/asset_image.dart';
import '../../../../../core/resources/pair.dart';
import '../../../../data/models/credit/user.dart';

class ChangeUserScreen extends StatefulWidget {
  const ChangeUserScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChangeUserScreenState createState() => _ChangeUserScreenState();
}

class _ChangeUserScreenState extends State<ChangeUserScreen> {
  RxList<UserEntity> listUser = RxList<UserEntity>([]);
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

      Pair<int, List<UserModel>> newData = await getListUser(currentPage);
      maxPages = newData.first;
      listUser.addAll(newData.second);

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

  final CreateRequestController createRequestController = Get.find();
  Future<Pair<int, List<UserModel>>> getListUser(int page) async {
    assert(page >= 1);
    final data =
        await createRequestController.searchUser(searchQuery.value, page);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Thay đổi người cho vay"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => searchQuery.value = value,
              onSubmitted: (value) {
                listUser.clear();
                currentPage = 1;
                loadMoreData();
              },
              decoration: InputDecoration(
                hintText: "Tìm kiếm",
                prefixIcon: const Icon(Icons.search),
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
                itemCount: listUser.length + (isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < listUser.length) {
                    return ListTile(
                      leading: listUser[index].avatar != null
                          ? ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: CachedNetworkImage(
                                imageUrl: listUser[index].avatar!,
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                                errorWidget: (context, _, __) {
                                  return const CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage(Assets.avatar2),
                                  );
                                },
                              ),
                            )
                          : const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(Assets.avatar2),
                            ),
                      title: Text(listUser[index].getFullName() ?? "unknown"),
                      subtitle: Text(listUser[index].email ?? ""),
                      onTap: () {
                        createRequestController.changeReceiver(listUser[index]);
                        Get.back();
                      },
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
