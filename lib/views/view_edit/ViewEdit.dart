import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_flutter_v2/controllers/notes_controller.dart';
import 'package:notes_flutter_v2/models/note.dart';
import 'package:notes_flutter_v2/views/custom_widget/cw_note_form.dart';

class ViewEdit extends StatelessWidget {
  ViewEdit({Key? key}) : super(key: key);
  final noteController = Get.put(NotesController());

  handleUpdate(String dataId) {
    noteController.updateNote(dataId);
  }

  Widget updateBtn(String dataId) {
    return ElevatedButton(
      onPressed: () {
        handleUpdate(dataId);
      },
      child: const Text("Update", style: TextStyle(fontSize: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments as Note;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      noteController.changeInputData(args.title, args.text);
    });

    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: CwNoteForm(
            titleController: noteController.titleInputController.value,
            textController: noteController.textInputController.value,
            actionContent: updateBtn(args.id)));
  }
}
