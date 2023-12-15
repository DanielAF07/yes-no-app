import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ReceivedMessage extends StatelessWidget {
  final Message message;
  const ReceivedMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final textMesssage = message.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:
                Text(textMesssage, style: const TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 8),
        if (message.imageUrl != null) _ImageBubble(message.imageUrl!)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Image.network(
                imageUrl,
                width: size.width * 0.7,
                height: 150,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Column(
                    children: [
                      Container(
                        width: size.width * 0.7,
                        height: 150,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        color: colors.primary.withOpacity(0.1),
                        child: const Center(child: Text('Loading...')),
                      ),
                      const SizedBox(height: 8)
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
