import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/model/contact_model.dart';

class ChatNotifier extends StateNotifier<List<ChatMessage>> {
  ChatNotifier() : super([]);

  ChatNotifier.init() : super([]) {
    _initalMessages();
  }

  void _initalMessages() {
    List<ChatMessage> chatHistory = [];
    for (int i = 0; i < initialMessages.length; i++) {
      chatHistory.add(ChatMessage(
        text: initialMessages[i],
        isBot: true,
      ));
    }
    state =  chatHistory;
  }

  void updateState(List<ChatMessage> chatHistory) {
    state = chatHistory;
  }
}

final chatProvider = StateNotifierProvider<ChatNotifier, List<ChatMessage>>(
    (ref) => ChatNotifier.init());
