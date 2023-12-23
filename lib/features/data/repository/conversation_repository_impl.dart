import 'package:_88credit_flutter/features/data/data_sources/local/authentication_local_data_source.dart';
import 'package:_88credit_flutter/features/data/data_sources/remote/conversation_remote_data_source.dart';
import 'package:_88credit_flutter/features/data/models/nhagiare/chat/conversation_model.dart';
import 'package:_88credit_flutter/features/data/models/nhagiare/chat/message_model.dart';
import 'package:_88credit_flutter/features/domain/repository/conversation_repository.dart';

class ConversationRepositoryImpl extends ConversationRepository {
  final ConversationRemoteDataSource _conversationRemoteDataSource;
  final AuthenLocalDataSrc _authenLocalDataSrc;
  ConversationRepositoryImpl(
      this._conversationRemoteDataSource, this._authenLocalDataSrc);

  @override
  void addConversationListener(Function(List<ConversationModel> p1) listener) {
    _conversationRemoteDataSource.addConversationListener(listener);
  }

  @override
  List<ConversationModel> getConversations() {
    return _conversationRemoteDataSource.getConversations();
  }

  @override
  void removeConversationListener(
      Function(List<ConversationModel> p1) listener) {
    _conversationRemoteDataSource.removeConversationListener(listener);
  }

  @override
  void addMessageListener(
      String conversationId, Function(List<MessageModel> p1) listener) {
    _conversationRemoteDataSource.addMessageListener(conversationId, listener);
  }

  @override
  List<MessageModel>? initChat(String conversationId) {
    return _conversationRemoteDataSource.initChat(conversationId);
  }

  @override
  void removeMessageListener(
      String conversationId, Function(List<MessageModel> p1) listener) {
    _conversationRemoteDataSource.removeMessageListener(
        conversationId, listener);
  }

  @override
  void sendTextMessage(String conversationId, String message) {
    _conversationRemoteDataSource.sendTextMessage(conversationId, message);
  }

  @override
  void connect() {
    final token = _authenLocalDataSrc.getAccessToken();
    _conversationRemoteDataSource.setAuthToken(token!);
    _conversationRemoteDataSource.connect();
  }

  @override
  void disconnect() {
    _conversationRemoteDataSource.disconnect();
  }
}
