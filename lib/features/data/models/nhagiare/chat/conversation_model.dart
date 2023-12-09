import 'package:_88credit_flutter/features/data/models/nhagiare/chat/message_model.dart';
import 'package:_88credit_flutter/features/data/models/nhagiare/chat/participant_model.dart';
import '../../../../domain/entities/nhagiare/chat/conversation.dart';
import '../../../../domain/entities/credit/user.dart';

// ignore: must_be_immutable
class ConversationModel extends Conversation {
  ConversationModel(
      {required super.id,
      required super.createdAt,
      required super.lastMessageId,
      required super.isRead,
      required super.lastMessage,
      required super.participants,
      required super.messages,
      required super.users});

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['id'],
      createdAt: DateTime.tryParse(json['created_at']) ?? DateTime.now(),
      lastMessageId: json['last_message_id'],
      isRead: json['is_read'],
      lastMessage: json['last_message'] != null
          ? MessageModel.fromJson(json['last_message'])
          : null,
      participants: List<ParticipantModel>.from((json['participants'] ?? [])
          .map((e) => ParticipantModel.fromJson(e))
          .toList()),
      messages: List<MessageModel>.from((json['messages'] ?? [])
          .map((e) => MessageModel.fromJson(e))
          .toList()),
      users: List<UserEntity>.from(
          ((json['users'] ?? []).map((e) => UserEntity.fromJson(e)).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'last_message_id': lastMessageId,
      'is_read': isRead,
      'last_message': lastMessage,
      'participants': participants,
      'messages': messages,
    };
  }
}
