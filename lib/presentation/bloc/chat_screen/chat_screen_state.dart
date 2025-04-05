import 'package:equatable/equatable.dart';

import '../../../domain/entities/chat_message_entity.dart';

class ChatScreenState extends Equatable {
  final List<ChatMessage> messages;
  final bool isLoading;

  const ChatScreenState({
    this.messages = const [],
    this.isLoading = false,
  });

  ChatScreenState copyWith({
    List<ChatMessage>? messages,
    bool? isLoading,
  }) {
    return ChatScreenState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [messages, isLoading];
}
