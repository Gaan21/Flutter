import 'package:chat_si_no/presentation/widgets/chat/her_message_bubble.dart';
import 'package:chat_si_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Duda al sacar el widget AppBar
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://img.bekia.es/celebrities/th/0000/136-th2.jpg"),
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? const HerMessageBubble()
                      : const MyMessageBubble();
                },
              ),
            ),
            Text("Como estan los máquinas"),
            Text("Lo primero de todo"),
          ],
        ),
      ),
    );
  }
}
