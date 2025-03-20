// To parse this JSON data, do
//
//     final getquestions = getquestionsFromJson(jsonString);

import 'dart:convert';

List<Getquestions> getquestionsFromJson(String str) => List<Getquestions>.from(
    json.decode(str).map((x) => Getquestions.fromJson(x)));

String getquestionsToJson(List<Getquestions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Getquestions {
  final int id;
  final String title;
  final dynamic isTrue;
  final int level;
  final List<Choice> choices;

  Getquestions({
    required this.id,
    required this.title,
    required this.isTrue,
    required this.level,
    required this.choices,
  });

  factory Getquestions.fromJson(Map<String, dynamic> json) => Getquestions(
        id: json["id"],
        title: json["title"],
        isTrue: json["isTrue"],
        level: json["level"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "isTrue": isTrue,
        "level": level,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
      };
}

class Choice {
  final int id;
  final String title;
  final bool isTrue;

  Choice({
    required this.id,
    required this.title,
    required this.isTrue,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        id: json["id"],
        title: json["title"],
        isTrue: json["isTrue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "isTrue": isTrue,
      };
}
