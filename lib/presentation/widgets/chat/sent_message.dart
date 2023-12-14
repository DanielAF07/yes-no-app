import 'package:flutter/material.dart';

class SentMessage extends StatelessWidget {
  const SentMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('lorem10 lorem10 lorem10 lorem10 lorem10 lorem10',
                style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
