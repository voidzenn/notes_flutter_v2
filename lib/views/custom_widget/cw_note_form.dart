import 'package:flutter/material.dart';

class CwNoteForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController textController;
  final Widget actionContent;

  const CwNoteForm(
      {Key? key,
      required this.titleController,
      required this.textController,
      required this.actionContent})
      : super(key: key);

  Widget titleInput() {
    return TextFormField(
        controller: titleController,
        decoration: const InputDecoration(hintText: "Enter Title"));
  }

  Widget textInput() {
    return TextFormField(
        controller: textController,
        decoration: const InputDecoration(hintText: "Enter Text"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        titleInput(),
        textInput(),
        actionContent,
      ],
    );
  }
}
