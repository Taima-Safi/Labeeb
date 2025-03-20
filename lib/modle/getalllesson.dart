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
  final String title;
  final String description;
  final String subjectTitle;

  Allcategorymodel({
    required this.id,
    required this.title,
    required this.description,
    required this.subjectTitle,
  });

  factory Allcategorymodel.fromJson(Map<String, dynamic> json) =>
      Allcategorymodel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        subjectTitle: json["subjectTitle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "subjectTitle": subjectTitle,
      };
}
