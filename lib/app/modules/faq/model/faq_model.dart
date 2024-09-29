// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'dart:convert';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  int? status;
  bool? success;
  String? message;
  List<Datum>? data;

  FaqModel({
     this.status,
     this.success,
     this.message,
     this.data,
  });


  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] != null ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))) :
    List<Datum>.from(json["data"].map((x) => Datum.empty())),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String title;
  String description;

  Datum({
    required this.id,
    required this.title,
    required this.description,
  });


  factory Datum.empty() => Datum(
    id: 0,
    title: "",
    description: "",
  );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
  };
}
