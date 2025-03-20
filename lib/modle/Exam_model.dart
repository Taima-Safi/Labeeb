// To parse this JSON data, do
//
//     final getExam = getExamFromJson(jsonString);

import 'dart:convert';

List<GetExam> getExamFromJson(String str) =>
    List<GetExam>.from(json.decode(str).map((x) => GetExam.fromJson(x)));

String getExamToJson(List<GetExam> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetExam {
  final int id;
  final String? title;
  final int grade;
  final List<dynamic> exams;

  GetExam({
    required this.id,
    required this.title,
    required this.grade,
    required this.exams,
  });

  factory GetExam.fromJson(Map<String, dynamic> json) => GetExam(
        id: json["id"],
        title: json["title"],
        grade: json["grade"],
        exams: List<dynamic>.from(json["exams"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "grade": grade,
        "exams": List<dynamic>.from(exams.map((x) => x)),
      };
}

class Exam {
  final int id;
  final String title;

  Exam({
    required this.id,
    required this.title,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
