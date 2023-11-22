// import '../../models/chat/message_model.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
//
// abstract class MessageRemoteDataSource {
//   List<MessageModel> getMessages(String conversationId);
//
//   void addListener(String conversationId,
//       Function(List<MessageModel>) listener);
//
//   void removeListener(String conversationId,
//       Function(List<MessageModel>) listener);
//
//   void sendMessage(String conversationId, String message);
//
//   void dispose();
//
//   void connect(String conversationId);
// }
//
// class MessageRemoteDataSourceImpl extends MessageRemoteDataSource {
//   late IO.Socket socket;
//   final List<Function(List<MessageModel>)> _listeners = [];
//   final List
//
//   @override
//   void addListener(String conversationId,
//       Function(List<MessageModel> p1) listener) {
//     _listeners.add(listener);
//   }
//
//   @override
//   void connect(String conversationId) {
//     socket = IO.io('http://192.168.137.1:8000/messages', <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': false,
//       'conversation_id': conversationId
//     });
//     socket.auth = {"token": "1a9a5785-721a-4bb5-beb7-9d752e2070d4"};
//     socket.onConnect((data) {
//       print('Connected');
//       print(data);
//     });
//     socket.on('messages', (res)  {
//       String type = res["type"];
//       if (type == "init") {
//         List<dynamic> data = res["data"] ?? [];
//         _messages[conversationId] = [];
//         _messages[conversationId]
//             .addAll((data).map((e) => MessageModel.fromJson(e)).toList());
//         _listeners.forEach((element) {
//           element(_messages[conversationId] ?? []);
//         });
//       } else if (type == "new") {
//         _messages[conversationId]?.add(MessageModel.fromJson(data["data"]));
//       } else if (type == "update") {
//         _messages[conversationId]
//             ?.removeWhere((element) => element.id == data["data"]["id"]);
//         _messages[conversationId]
//             ?.add(MessageModel.fromJson(data["data"]));
//       } else if (type == "delete") {
//         _messages[conversationId]
//             ?.removeWhere((element) => element.id == data["data"]["id"]);
//       }
//       for (var element in _listeners) {
//         element(_messages[conversationId] ?? []);
//       }
//     });
//   }
//
//   @override
//   void dispose() {}
//
//   @override
//   List<MessageModel> getMessages(String conversationId) {
//     return _messages[conversationId] ?? [];
//   }
//
//   @override
//   void removeListener(String conversationId,
//       Function(List<MessageModel> p1) listener) {
//     _listeners.remove(listener);
//   }
//
//   @override
//   void sendMessage(String conversationId, String message) {
//     socket.emit("send_message", {"content": message});
//   }
// }
