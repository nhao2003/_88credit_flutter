import 'dart:async';
import 'package:get/get.dart';
import 'package:_88credit_flutter/features/data/models/nhagiare/chat/conversation_model.dart';
import 'package:_88credit_flutter/features/data/models/nhagiare/chat/message_model.dart';
import 'package:_88credit_flutter/features/domain/repository/conversation_repository.dart';
import 'package:_88credit_flutter/injection_container.dart';

class ChatController extends GetxController {
  final ConversationRepository _conversationRemoteDataSourceImpl =
      sl.get<ConversationRepository>();
  final StreamController<List<ConversationModel>>
      _conversationsStreamController =
      StreamController<List<ConversationModel>>();
  Stream<List<ConversationModel>> getConversations() {
    return _conversationsStreamController.stream;
  }

  late String conversationId;
  final StreamController<List<MessageModel>> _messagesStreamController =
      StreamController<List<MessageModel>>();

  Stream<List<MessageModel>> get messages => _messagesStreamController.stream;
  void listenerConversation(List<ConversationModel> data) {
    _conversationsStreamController.sink.add(data);
  }

  void initConversation() {
    _conversationsStreamController.sink
        .add(_conversationRemoteDataSourceImpl.getConversations());
    _conversationRemoteDataSourceImpl
        .addConversationListener(listenerConversation);
  }

  void disposeConversation() {
    _conversationRemoteDataSourceImpl
        .removeConversationListener(listenerConversation);
  }

  void listenerMessage(List<MessageModel> data) {
    _messagesStreamController.sink.add(data);
  }

  void initMessage(String conversationId) {
    this.conversationId = conversationId;
    List<MessageModel>? messages =
        _conversationRemoteDataSourceImpl.initChat(conversationId);
    if (messages != null) {
      _messagesStreamController.sink.add(messages);
    }
    _conversationRemoteDataSourceImpl.addMessageListener(
        conversationId, listenerMessage);
  }

  void disposeMessage() {
    _conversationRemoteDataSourceImpl.removeMessageListener(
        conversationId, listenerMessage);
  }

  void sendMessage(String message) {
    _conversationRemoteDataSourceImpl.sendTextMessage(conversationId, message);
  }
}
