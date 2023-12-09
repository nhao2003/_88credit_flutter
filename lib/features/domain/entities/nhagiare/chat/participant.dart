import 'package:equatable/equatable.dart';
import '../../credit/user.dart';

class Participant extends Equatable {
  final String conversationId;
  final String userId;
  final DateTime joinedAt;
  final DateTime? readLastMessageAt;
  final UserEntity? user;

  const Participant({
    required this.conversationId,
    required this.userId,
    required this.joinedAt,
    required this.readLastMessageAt,
    required this.user,
  });

  @override
  List<Object?> get props => [
        conversationId,
        userId,
        joinedAt,
        readLastMessageAt,
        user,
      ];
}
