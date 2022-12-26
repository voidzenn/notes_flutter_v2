import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_flutter_v2/controllers/notes_controller.dart';
import 'package:notes_flutter_v2/views/custom_widget/cw_note_form.dart';

class Create extends StatelessWidget {
  Create({Key? key}) : super(key: key);
  final noteController = Get.put(NotesController());

  handleSave() {
    noteController.createNote();
  }

  Widget saveBtn() {
    return ElevatedButton(
      onPressed: () {
        handleSave();
      },
      child: const Text("Save", style: TextStyle(fontSize: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Set inputs to blank on load
    noteController.titleInputController.value.text = "";
    noteController.textInputController.value.text = "";

    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: CwNoteForm(
            titleController: noteController.titleInputController.value,
            textController: noteController.textInputController.value,
            actionContent: saveBtn()));
  }
}
