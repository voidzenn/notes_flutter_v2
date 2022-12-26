import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_flutter_v2/controllers/notes_controller.dart';
import 'package:notes_flutter_v2/models/note.dart';
import 'package:notes_flutter_v2/routes/routes.dart';
import 'package:notes_flutter_v2/views/custom_widget/cw_card.dart';

class Home extends StatelessWidget {
  final noteController = Get.put(NotesController());
  final arr = [];

  Home({Key? key}) : super(key: key);

  handleCardClick(Note data) {
    Get.toNamed(Routes.viewEdit, arguments: data);
  }

  Widget deleteButton(Note data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
      child: ElevatedButton(
          onPressed: () {
            noteController.deleteNote(data);
          },
          child: const Icon(Icons.delete)),
    );
  }

  Widget mainTemplate() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(child: Obx(() {
        return ListView.builder(
            itemCount: noteController.notes.length,
            itemBuilder: (context, index) {
              var note = noteController.notes[index];

              return CwCard(
                  callback: () => handleCardClick(note),
                  button: deleteButton(note),
                  content: Text("${note.title} | ${note.text}",
                      style: const TextStyle(
                          fontFamily: 'RobotMedium',
                          fontWeight: FontWeight.bold)));
            });
      }))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      noteController.changeInputData('', '');
    });

    return mainTemplate();
  }
}
