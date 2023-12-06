import 'package:_88credit_flutter/features/data/models/nhagiare/chat/conversation_model.dart';
import 'package:_88credit_flutter/features/data/models/nhagiare/chat/message_model.dart';

abstract class ConversationRepository {
  void addConversationListener(Function(List<ConversationModel>) listener);
  void removeConversationListener(Function(List<ConversationModel>) listener);
  List<ConversationModel> getConversations();
  void addMessageListener(
      String conversationId, Function(List<MessageModel>) listener);
  void removeMessageListener(
      String conversationId, Function(List<MessageModel>) listener);
  List<MessageModel>? initChat(String conversationId);
  void sendTextMessage(String conversationId, String message);
  void connect();
  void disconnect();
}
