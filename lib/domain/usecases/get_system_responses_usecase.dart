import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/chat_message_entity.dart';
import '../repositories/chat_repository.dart';

class GetSystemResponseUsecase {
  final ChatRepository repository;

  GetSystemResponseUsecase(this.repository);

  Future<Either<Failure, ChatMessage>> call() async {
    return await repository.getSystemResponse();
  }
}
