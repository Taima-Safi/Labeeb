// To parse this JSON data, do
//
//     final allcategorymodel = allcategorymodelFromJson(jsonString);

import 'dart:convert';

List<Allcategorymodel> allcategorymodelFromJson(String str) =>
    List<Allcategorymodel>.from(
        json.decode(str).map((x) => Allcategorymodel.fromJson(x)));

String allcategorymodelToJson(List<Allcategorymodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Allcategorymodel {
  final int id;
  final String? title;
  final int grade;
  final List<dynamic> exams;

  Allcategorymodel({
    required this.id,
    required this.title,
    required this.grade,
    required this.exams,
  });

  factory Allcategorymodel.fromJson(Map<String, dynamic> json) =>
      Allcategorymodel(
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
