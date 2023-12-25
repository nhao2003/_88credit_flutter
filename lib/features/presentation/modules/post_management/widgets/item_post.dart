import 'package:flutter/material.dart';
import 'package:_88credit_flutter/features/domain/enums/post_status_management.dart';
import '../../../../../config/theme/app_color.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../domain/entities/credit/post.dart';

class ItemPost extends StatefulWidget {
  final PostEntity post;
  final PostStatusManagement statusCode;
  final String status;
  final List<String> funcs;
  final List<IconData> iconFuncs;
  final Function onSelectedMenu;
  final Function onTap;

  const ItemPost({
    required this.statusCode,
    required this.status,
    required this.post,
    required this.funcs,
    required this.iconFuncs,
    required this.onSelectedMenu,
    required this.onTap,
    super.key,
  });

  @override
  State<ItemPost> createState() => _ItemPostState();
}

class _ItemPostState extends State<ItemPost> {
  double sizeImage = 80;

  int selectedMenu = 0;
  Color getColorStatus() {
    switch (widget.statusCode) {
      case PostStatusManagement.approved:
        return AppColors.green800;
      case PostStatusManagement.pending:
        return AppColors.blue800;
      case PostStatusManagement.rejected:
        return AppColors.red800;
      case PostStatusManagement.hided:
        return AppColors.grey700;
      case PostStatusManagement.exprired:
        return AppColors.yellow800;
    }
  }

  Color getColorBackground() {
    switch (widget.statusCode) {
      case PostStatusManagement.approved:
        return AppColors.green100;
      case PostStatusManagement.pending:
        return AppColors.blue100;
      case PostStatusManagement.rejected:
        return AppColors.red100;
      case PostStatusManagement.hided:
        return AppColors.grey100;
      case PostStatusManagement.exprired:
        return AppColors.yellow100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.post);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.grey300,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: getColorBackground(),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            widget.status,
                            style: AppTextStyles.medium12
                                .copyWith(color: getColorStatus()),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.post.title ?? "Không có tiêu đề",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.medium14.copyWith(
                            color: AppColors.grey700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "Số tiền: ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.medium14.copyWith(
                                color: AppColors.grey700,
                              ),
                            ),
                            Text(
                              "${widget.post.loanAmount}VNĐ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bold14.copyWith(
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "Loại bài đăng: ",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.regular12.copyWith(
                                color: AppColors.grey500,
                              ),
                            ),
                            Text(
                              widget.post.type!.getStringVi(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bold12.copyWith(
                                color: AppColors.grey500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // more icon
            PopupMenuButton<int>(
              initialValue: selectedMenu,
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.grey300,
              ),
              color: AppColors.white,
              // Callback that sets the selected popup menu item.
              onSelected: (int item) {
                setState(() {
                  selectedMenu = item;
                  widget.onSelectedMenu(item, widget.post);
                });
              },
              itemBuilder: (BuildContext context) =>
                  widget.funcs.asMap().entries.map(
                (e) {
                  int i = e.key;
                  String val = e.value;
                  return PopupMenuItem<int>(
                    value: i,
                    child: Row(
                      children: [
                        Icon(widget.iconFuncs[i]),
                        const SizedBox(width: 15),
                        Text(val),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
