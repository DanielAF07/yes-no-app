import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Hola hola!', style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 8),
        _ImageBubble()
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
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
                'https://yesno.wtf/assets/yes/4-c53643ecec77153eefb461e053fb4947.gif',
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
        SizedBox(height: 8)
      ],
    );
  }
}
