import 'package:dartz/dartz.dart';

import '../entities/chat_message_entity.dart';
import '../../core/error/failures.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatMessage>> getSystemResponse();
}
