import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/chat_message_entity.dart';
import '../../../domain/usecases/get_system_responses_usecase.dart';
import 'chat_screen_state.dart';

class ChatScreenCubit extends Cubit<ChatScreenState> {
  final GetSystemResponseUsecase _getSystemResponse;

  ChatScreenCubit(this._getSystemResponse) : super(const ChatScreenState());

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final List<ChatMessage> updatedMessages = List.from(state.messages)
      ..add(ChatMessage(text: text, isUser: true));
    emit(state.copyWith(messages: updatedMessages));

    emit(state.copyWith(isLoading: true));

    final result = await _getSystemResponse();

    result.fold(
      (failure) {
        updatedMessages.add(ChatMessage(
          text: failure.message,
          isUser: false,
        ));
        emit(state.copyWith(
          messages: updatedMessages,
          isLoading: false,
        ));
      },
      (systemMessage) {
        updatedMessages.add(systemMessage);
        emit(state.copyWith(
          messages: updatedMessages,
          isLoading: false,
        ));
      },
    );
  }
}
