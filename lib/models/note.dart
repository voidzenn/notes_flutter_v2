import 'dart:convert';

List<Note> noteFromJson(String str) =>
    List<Note>.from(json.decode(str).map((x) => Note.fromJson(x)));

List<Note> noteFromJsonDesc(String str) =>
    List<Note>.from(json.decode(str).map((x) => Note.fromJson(x)));

String noteToJson(List<Note> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Note {
  Note({
    required this.title,
    required this.text,
    required this.id,
  });

  String title;
  String text;
  String id;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        title: json["title"],
        text: json["text"],
        id: json["id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
        "id": id,
      };

  Map<String, dynamic> toJsonCreate() => {
        "title": title,
        "text": text,
      };
}
