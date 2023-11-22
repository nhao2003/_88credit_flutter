import 'package:equatable/equatable.dart';
import 'package:_88credit_flutter/features/domain/enums/message_types.dart';

class Message extends Equatable {
  final String id;
  final String conversationId;
  final String senderId;
  final MessageTypes contentType;
  final Map<String, dynamic> content;
  final DateTime sentAt;

  const Message({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.contentType,
    required this.content,
    required this.sentAt,
  });

  @override
  List<Object?> get props => [
        id,
        conversationId,
        senderId,
        contentType,
        content,
        sentAt,
      ];

  bool get isMine => senderId == 'me';
}
