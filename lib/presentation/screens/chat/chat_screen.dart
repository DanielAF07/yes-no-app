import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/received_message.dart';
import 'package:yes_no_app/presentation/widgets/chat/sent_message.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Lily Collins ❤️',
              style:
                  TextStyle(fontWeight: FontWeight.w600, letterSpacing: -0.5)),
          leading: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://static01.nyt.com/images/2016/11/03/fashion/03SKIN1/03SKIN1-superJumbo-v2.jpg?quality=75&auto=webp'),
            ),
          )),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const ReceivedMessage()
                    : const SentMessage();
              },
            ),
          ),
          const MessageFieldBox()
        ]),
      ),
    );
  }
}
