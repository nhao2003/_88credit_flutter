import 'package:_88credit_flutter/features/domain/entities/nhagiare/chat/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:_88credit_flutter/config/theme/app_color.dart';
import 'package:_88credit_flutter/config/theme/text_styles.dart';
import 'package:_88credit_flutter/core/extensions/textstyle_ex.dart';
import 'package:_88credit_flutter/features/data/models/nhagiare/chat/message_model.dart';
import 'package:_88credit_flutter/features/presentation/global_widgets/my_appbar.dart';
import 'package:_88credit_flutter/features/presentation/modules/chat/chat_controler.dart';
import '../../../../domain/entities/nhagiare/chat/conversation.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final Conversation conversation = Get.arguments;
  late final FocusNode _focusNode;
  late final TextEditingController _textEditingController;
  RxBool isShowButtons = true.obs;
  ChatController controller = ChatController();
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      _updateShowButtons();
    });
    _textEditingController = TextEditingController();
    controller.initMessage(conversation.id);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _textEditingController.dispose();
    controller.disposeMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: 'Nguyễn Nhật Hào', // Replace with the participant's name
      ),
      body: StreamBuilder<List<MessageModel>>(
          stream: controller.messages,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<MessageModel> messages = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      Message message = messages[index];
                      bool isMe = message.senderId == 'user1';
                      return Row(
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isMe ? AppColors.green800 : AppColors.grey100,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(message.content['text'] ?? "Null",
                                style: AppTextStyles.regular16.colorEx(
                                  isMe ? AppColors.white : AppColors.black,
                                )),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                _buildMessageInput(),
              ],
            );
          }),
    );
  }

  bool _updateShowButtons() {
    bool val = !_focusNode.hasFocus || _textEditingController.text.isEmpty;
    if (isShowButtons.value != val) {
      isShowButtons.value = val;
    }
    return val;
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Obx(
        () => Row(
          children: [
            Visibility(
              visible: isShowButtons.value,
              child: IconButton(
                icon: const Icon(
                  HeroiconsSolid.photo,
                  color: AppColors.green,
                ),
                onPressed: () {
                  // Implement the logic to handle image
                },
              ),
            ),
            Expanded(
              child: TextField(
                maxLines: 6,
                minLines: 1,
                controller: _textEditingController,
                onChanged: (value) {
                  _updateShowButtons();
                },
                focusNode: _focusNode,
                onTapOutside: (event) => _focusNode.unfocus(),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  border: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  hintText: 'Tin nhắn',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                HeroiconsSolid.paperAirplane,
                color: AppColors.green,
              ),
              onPressed: () {
                controller
                    .sendMessage(_textEditingController.text.trim().toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
