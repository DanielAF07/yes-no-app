import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class SentMessage extends StatelessWidget {
  final Message message;
  const SentMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textMessage = message.text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:
                Text(textMessage, style: const TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
