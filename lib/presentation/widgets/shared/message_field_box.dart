import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black26),
      borderRadius: BorderRadius.circular(40),
    );

    var inputDecoration = InputDecoration(
      hintText: 'Text Message',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
      filled: false,
      suffixIcon: IconButton(
          icon: const Icon(
            Icons.send_outlined,
          ),
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
            focusNode.requestFocus();
          }),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            letterSpacing: 0,
          ),
          textCapitalization: TextCapitalization.sentences,
          onTapOutside: (event) {
            focusNode.unfocus();
          },
          focusNode: focusNode,
          controller: textController,
          decoration: inputDecoration,
          onFieldSubmitted: (value) {
            onValue(value);
            textController.clear();
            focusNode.requestFocus();
          },
        ),
      ),
    );
  }
}
