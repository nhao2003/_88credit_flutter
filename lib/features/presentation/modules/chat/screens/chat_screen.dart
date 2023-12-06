import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/config/values/asset_image.dart';
import 'package:_88credit_flutter/core/extensions/date_ex.dart';
import 'package:_88credit_flutter/core/extensions/integer_ex.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/chat/screens/chat_detail_screen.dart';
import '../../../../domain/entities/nhagiare/chat/conversation.dart';
import '../chat_controler.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key}) {
    controller.initConversation();
  }

  final ChatController controller = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Tin nhắn"),
      body: StreamBuilder<List<Conversation>>(
        stream: controller.getConversations(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final conversations = snapshot.data!;
            return conversations.isNotEmpty
                ? _buildConversationList(conversations)
                : _buildEmptyChatMessage();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildConversationList(List<Conversation> conversations) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          Conversation conversation = conversations[index];

          // Check if the current item is not the last one to avoid adding divider after the last item
          bool isLastItem = index == conversations.length - 1;

          return Column(
            children: [
              ListTile(
                onTap: () {
                  Get.to(() => const ChatDetailScreen(),
                      arguments: conversation);
                },
                titleAlignment: ListTileTitleAlignment.threeLine,
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Assets.avatar2),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    conversation.users == null
                        ? 'Người dùng'
                        : conversation.users![0].fullName,
                    style: AppTextStyles.semiBold16,
                  ),
                ),
                subtitle: Text(
                  conversation.lastMessage?.content['text'] ??
                      'Bắt đầu cuộc trò chuyện ngay',
                  style: conversation.isRead ?? true
                      ? AppTextStyles.semiBold14
                      : AppTextStyles.regular14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  conversation.lastMessage?.sentAt.getTimeAgo() ??
                      DateTime.now().getTimeAgo(),
                  style: AppTextStyles.regular14,
                ),
              ),
              // Add Divider unless it's the last item
              if (!isLastItem)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(
                    color: AppColors.grey100,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyChatMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            width: 65.wp,
            child: Image.asset(Assets.emptyChat),
          ),
          Text(
            'Chưa có tin nhắn nào',
            style: AppTextStyles.regular16,
          )
        ],
      ),
    );
  }
}
