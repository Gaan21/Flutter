import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();

    final FocusNode focusNode = FocusNode();

    final onlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(20));

    final inputDecoration = InputDecoration(
      hintText: "Escribe un mensaje",
      enabledBorder: onlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textController.value.text;
          onValue(textValue);
          textController.clear();
        },
      ),
    );

    return TextFormField(
      //scrollController: chatProvider.scrollController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      keyboardAppearance: Brightness.dark,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(textController.value.text);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
