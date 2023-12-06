import 'package:_88credit_flutter/features/data/models/nhagiare/chat/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:_88credit_flutter/features/data/models/nhagiare/chat/conversation_model.dart';

abstract class ConversationRemoteDataSource {
  List<ConversationModel> getConversations();
  void addConversationListener(Function(List<ConversationModel>) listener);
  void removeConversationListener(Function(List<ConversationModel>) listener);
  void addMessageListener(
      String conversationId, Function(List<MessageModel>) listener);
  void removeMessageListener(
      String conversationId, Function(List<MessageModel>) listener);
  List<MessageModel>? initChat(String conversationId);
  void sendTextMessage(String conversationId, String message);
  void disconnect();
  void connect();
  void setAuthToken(String token);
}

class ConversationRemoteDataSourceImpl implements ConversationRemoteDataSource {
  late IO.Socket socket;
  final List<Function(List<ConversationModel>)> _conversationListener = [];
  final Map<String, List<Function(List<MessageModel>)>> _messageListener = {};
  final List<ConversationModel> _conversations = [];
  final Map<String, List<MessageModel>> _messages = {};
  late final String authToken;

  @override
  List<ConversationModel> getConversations() {
    return _conversations;
  }

  @override
  void addConversationListener(Function(List<ConversationModel>) listener) {
    _conversationListener.add(listener);
  }

  @override
  void removeConversationListener(Function(List<ConversationModel>) listener) {
    _conversationListener.remove(listener);
  }

  @override
  void disconnect() {
    _messageListener.clear();
    _conversationListener.clear();
    socket.disconnect();
    socket.dispose();
  }

  @override
  void connect() {
    socket = IO.io('http://192.168.137.1:8000/conversations', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false
    });
    socket.auth = {"token": authToken};
    socket.onConnect((data) {
      print('Connected');
      print(data);
    });
    socket.on('conversations', (result) {
      print("Received: $result");
      String type = result["type"];
      if (type == "init") {
        List<dynamic> data = result["data"] ?? [];
        _conversations.clear();
        _conversations.addAll(
            (data).map((e) => ConversationModel.fromJson(e)).toList().reversed);
        for (var element in _conversationListener) {
          element(_conversations);
        }
      } else if (type == "new") {
        _conversations.insert(0, ConversationModel.fromJson(result["data"]));
      } else if (type == "update") {
        _conversations
            .removeWhere((element) => element.id == result["data"]["id"]);
        _conversations.add(ConversationModel.fromJson(result["data"]));
      } else if (type == "delete") {
        _conversations
            .removeWhere((element) => element.id == result["data"]["id"]);
      }
      for (var element in _conversationListener) {
        element(_conversations);
      }
      socket.on('messages', (data) {
        String type = data["type"] as String;
        String conversationId = data["conversation_id"] as String;
        print("Received: $data");
        if (type == 'init') {
          List<dynamic> messages = data["data"] ?? [];
          _messages[conversationId] =
              messages.map((e) => MessageModel.fromJson(e)).toList();
        } else if (type == 'new') {
          MessageModel message = MessageModel.fromJson(data["data"]);
          _messages[conversationId]!.insert(0, message);
        } else if (type == 'update') {
          MessageModel message = MessageModel.fromJson(data["data"]);
          int index = _messages[conversationId]!
              .indexWhere((element) => element.id == message.id);
          _messages[conversationId]![index] = message;
        } else if (type == 'delete') {
          MessageModel message = MessageModel.fromJson(data["data"]);
          _messages[conversationId]!
              .removeWhere((element) => element.id == message.id);
        }
        if (_messageListener.containsKey(conversationId)) {
          for (var element in _messageListener[conversationId]!) {
            element(_messages[conversationId]!);
          }
        }
      });
    });
    socket.connect().onError((data) => print(data));
  }

  @override
  void addMessageListener(
      String conversationId, Function(List<MessageModel> p1) listener) {
    if (_messageListener.containsKey(conversationId)) {
      _messageListener[conversationId]!.add(listener);
    } else {
      _messageListener[conversationId] = [listener];
    }
  }

  @override
  void removeMessageListener(
      String conversationId, Function(List<MessageModel> p1) listener) {
    if (_messageListener.containsKey(conversationId)) {
      _messageListener[conversationId]!.remove(listener);
    }
  }

  @override
  List<MessageModel>? initChat(String conversationId) {
    if (_messages.containsKey(conversationId)) {
      return _messages[conversationId];
    } else {
      socket.emit('init_chat', conversationId);
      return null;
    }
  }

  @override
  void sendTextMessage(String conversationId, String message) {
    socket.emit('send_message', {
      "conversation_id": conversationId,
      "content": message,
    });
  }

  @override
  void setAuthToken(String token) {
    authToken = token;
  }
}
