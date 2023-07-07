import 'package:chat_si_no/config/helpers/get_yes_no_answer.dart';
import 'package:chat_si_no/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  final getYesOrNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    //Si descomento los dos que hay en la lista da error porque intenta
    // coger la imageurl cuando no existe
    Message(
      text: "Eyyy",
      fromWho: FromWho.me,
    ),
    Message(
      text: "33",
      fromWho: FromWho.fernando,
    ),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final Message newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith("?")) {
      await fernandoReply();
    }

    notifyListeners();
    moveScrollToEnd();
  }

  Future<void> fernandoReply() async {
    final fernandoMessage = await getYesOrNoAnswer.getAnswer();
    messagesList.add(fernandoMessage);
    notifyListeners();
  }

  Future<void> moveScrollToEnd() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
