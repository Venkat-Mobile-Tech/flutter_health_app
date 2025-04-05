import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../domain/entities/chat_message_entity.dart';

abstract class ChatRemoteDataSource {
  Future<Either<Failure, ChatMessage>> getRandomSystemResponse();
}
