import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_flutter_v2/controllers/notes_controller.dart';
import 'package:notes_flutter_v2/routes/routes.dart';
import 'package:notes_flutter_v2/views/custom_widget/cw_dialog.dart';

class MainLayout extends StatelessWidget {
  final Widget content;

  const MainLayout({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesController = Get.put(NotesController());

    return Scaffold(
      appBar: AppBar(
        leading: Visibility(
            visible: !Routes.isHomePage(),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.toNamed(Routes.home);
              },
            )),
        leadingWidth: Routes.isHomePage() ? 0 : 40,
        title: const Text(
          "Notes V2",
          style: TextStyle(fontFamily: 'RobotoMedium'),
        ),
      ),
      body: Stack(
        children: [
          content,
          Obx(() => notesController.openDialog.value
              ? CwDialog(
                  title: "Message",
                  content: Text(
                    notesController.responseMessage.value,
                    style: TextStyle(
                        color: notesController.responseSuccess.value
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold),
                  ))
              : Container())
        ],
      ),
      floatingActionButton: Opacity(
        opacity: Routes.isHomePage() ? 1 : 0,
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(Routes.create);
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24),
          ),
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
