import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/dependency_injection/injection_container.dart';
import '../../core/theme/app_theme.dart';
import '../bloc/chat_screen/chat_screen_cubit.dart';
import '../bloc/chat_screen/chat_screen_state.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatScreenCubit, ChatScreenState>(
      bloc: serviceLocator<ChatScreenCubit>(),
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: state.messages.isEmpty && !state.isLoading
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.chat_bubble_outline,
                            size: 64,
                            color: AppTheme.systemMessageTextColor,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 10.0,
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  'No messages yet',
                                  style: TextStyle(
                                    color: AppTheme.systemMessageTextColor,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Start a conversation',
                                  style: TextStyle(
                                    color: AppTheme.systemMessageTextColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      reverse: true,
                      itemCount:
                          state.messages.length + (state.isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (state.isLoading && index == 0) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 0.7,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 10.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        AppTheme.systemMessageBackgroundColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Typing...',
                                        style: TextStyle(
                                          color:
                                              AppTheme.systemMessageTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        final messageIndex =
                            state.isLoading ? index - 1 : index;
                        final message = state
                            .messages[state.messages.length - 1 - messageIndex];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: message.isUser
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  color: message.isUser
                                      ? AppTheme.userMessageBackgroundColor
                                      : AppTheme.systemMessageBackgroundColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  message.text,
                                  style: TextStyle(
                                    color: message.isUser
                                        ? AppTheme.userMessageTextColor
                                        : AppTheme.systemMessageTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Ask anything',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                        ),
                        onSubmitted: (text) {
                          serviceLocator<ChatScreenCubit>().sendMessage(text);
                          _controller.clear();
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      serviceLocator<ChatScreenCubit>()
                          .sendMessage(_controller.text);
                      _controller.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
