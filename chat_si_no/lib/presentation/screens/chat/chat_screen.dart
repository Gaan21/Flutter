import 'package:chat_si_no/domain/entities/message.dart';
import 'package:chat_si_no/presentation/providers/chat_provider.dart';
import 'package:chat_si_no/presentation/widgets/chat/her_message_bubble.dart';
import 'package:chat_si_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://static.motor.es/f1/pilotos/fernando-alonso.jpg"),
          ),
        ),
        title: const Text("Fernando Alonso"),
        centerTitle: false,
      ),
      body: _chatView(),
    );
  }
}

class _chatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  //Duda: que es este index?
                  final message = chatProvider.messagesList[index];

                  return (message.fromWho == FromWho.fernando)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
