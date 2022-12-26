import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_flutter_v2/models/note.dart';
import 'package:notes_flutter_v2/services/api_request.dart';

class NotesController extends GetxController {
  final request = ApiRequest(path: '/notes');
  final RxList<Note> notes = <Note>[].obs;
  final RxString responseMessage = ''.obs;
  final RxBool responseSuccess = false.obs;
  final RxBool openDialog = false.obs;
  final Rx<TextEditingController> titleInputController =
      TextEditingController().obs;
  final Rx<TextEditingController> textInputController =
      TextEditingController().obs;
  final String errorText = "Error, Pls try again";

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  RxBool get getResponseSuccess {
    return responseSuccess;
  }
  // Change or remove the input values
  void changeInputData(String title, String text) {
    titleInputController.value.text = title;
    textInputController.value.text = text;
  }

  bool isInputEmpty() {
    return titleInputController.value.text.isEmpty ||
        textInputController.value.text.isEmpty;
  }

  bool isRequestSuccessful(statusCode) {
    return statusCode == 200 || statusCode == 201;
  }

  void showDialogWithMessage(String message, bool isSuccess) {
    responseMessage.value = message;
    responseSuccess.value = isSuccess;
    openDialog.value = true;
  }

  void closeDialog() {
    if (openDialog.value) {
      openDialog.value = false;
    }
  }

  void textEmptyError() {
    showDialogWithMessage("Textfield should not be empty", false);
  }

  void responseError() {
    showDialogWithMessage(errorText, false);
  }

  void fetchNotes() async {
    var response = await request.get();
    if (isRequestSuccessful(response.statusCode)) {
      var finalData = noteFromJson(response.body);
      notes.value = finalData;
      responseMessage.value = 'Successfully received data';
    }
    responseMessage.value = errorText;
  }

  void createNote() async {
    if (!isInputEmpty()) {
      Note data = Note(
          id: '',
          title: titleInputController.value.text,
          text: textInputController.value.text);
      var newData = data.toJsonCreate();
      var response = await request.post(newData);

      if (isRequestSuccessful(response.statusCode)) {
        data.id = jsonDecode(response.body)['id'].toString();

        notes.add(data);
        showDialogWithMessage("Successfully Created note", true);
        titleInputController.value.clear();
        textInputController.value.clear();
      } else {
        responseError();
      }
    } else {
      textEmptyError();
    }
  }

  void updateNote(String dataId) async {
    Note data = Note(
        id: dataId,
        title: titleInputController.value.text,
        text: textInputController.value.text);
    var newData = data.toJson();
    if (!isInputEmpty()) {
      var response = await request.update(dataId, newData);

      if (isRequestSuccessful(response.statusCode)) {
        showDialogWithMessage("Successfully Update note", true);
        // Update specific data index with new data
        notes[notes.indexWhere((element) => element.id == dataId)] = data;
      } else {
        responseError();
      }
    } else {
      textEmptyError();
    }
  }

  void deleteNote(Note data) async {
    if (data.id != '') {
      var response = await request.delete(data.id);
      if (isRequestSuccessful(response.statusCode)) {
        // Remove data in display
        notes.remove(data);
        showDialogWithMessage("Successfully deleted note", true);
      } else {
        responseError();
      }
    } else {
      responseError();
    }
  }
}
