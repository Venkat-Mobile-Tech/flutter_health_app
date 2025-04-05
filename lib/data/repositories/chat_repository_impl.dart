import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ChatMessage>> getSystemResponse() async {
    return await remoteDataSource.getRandomSystemResponse();
  }
}
