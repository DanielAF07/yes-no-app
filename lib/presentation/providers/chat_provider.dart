import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'Hola amor!', from: From.He),
    Message(text: 'Regresaste?', from: From.He),
    Message(text: 'Ya regresé!', from: From.She),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, from: From.He);
    messagesList.add(newMessage);
    if (text.endsWith('?')) {
      receiveMessage();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> receiveMessage() async {
    final newMessage = await getYesNoAnswer.getAnswer();
    messagesList.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 300));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
