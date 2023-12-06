import 'package:_88credit_flutter/features/domain/enums/message_types.dart';
import '../../../../domain/entities/nhagiare/chat/message.dart';

class MessageModel extends Message {
  const MessageModel({
    required super.id,
    required super.conversationId,
    required super.senderId,
    required super.contentType,
    required super.content,
    required super.sentAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      conversationId: json['conversation_id'],
      senderId: json['sender_id'],
      contentType: MessageTypes.parse(json['content_type']),
      content: json['content'],
      sentAt: DateTime.tryParse(json['sent_at']) ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'conversation_id': conversationId,
      'sender_id': senderId,
      'content_type': contentType,
      'content': content,
      'sent_at': sentAt.toIso8601String(),
    };
  }
}
