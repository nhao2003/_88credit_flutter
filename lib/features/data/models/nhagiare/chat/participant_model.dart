import '../../../../domain/entities/nhagiare/chat/participant.dart';
import '../../credit/user.dart';

class ParticipantModel extends Participant {
  const ParticipantModel({
    required super.conversationId,
    required super.userId,
    required super.joinedAt,
    required super.readLastMessageAt,
    required super.user,
  });

  factory ParticipantModel.fromJson(Map<String, dynamic> json) {
    return ParticipantModel(
      conversationId: json['conversation_id'],
      userId: json['user_id'],
      joinedAt: DateTime.tryParse(json['joined_at']) ?? DateTime.now(),
      readLastMessageAt:
          DateTime.tryParse(json['read_last_message_at']) ?? DateTime.now(),
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'conversation_id': conversationId,
      'user_id': userId,
      'joined_at': DateTime.tryParse(joinedAt.toString()) ?? DateTime.now(),
      'read_last_message_at': DateTime.tryParse(readLastMessageAt.toString()),
      'user': user,
    };
  }
}
