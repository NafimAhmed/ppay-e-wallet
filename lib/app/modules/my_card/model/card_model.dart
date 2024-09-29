// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);

import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
  int? status;
  bool? success;
  String? message;
  List<Datum>? data;

  CardModel({
     this.status,
     this.success,
     this.message,
     this.data,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data:   json["data"] != null ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
    :  List<Datum>.from(json["data"].map((x) => Datum.empty())),
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
  String cardType;
  String holderName;
  String cardNumber;
  String mmYy;
  String cvv;
  int userId;

  Datum({
    required this.id,
    required this.cardType,
    required this.holderName,
    required this.cardNumber,
    required this.mmYy,
    required this.cvv,
    required this.userId,

  });



  factory Datum.empty() => Datum(
    id: 0,
    cardType: "",
    holderName: "",
    cardNumber: "",
    mmYy: "",
      cvv: "000",
      userId:0

  );


  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    cardType: json["card_type"],
    holderName: json["holder_name"],
    cardNumber: json["card_number"],
    mmYy: json["mm_yy"],
    cvv: json["cvv"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "card_type": cardType,
    "holder_name": holderName,
    "card_number": cardNumber,
    "mm_yy": mmYy,
    "cvv": cvv,
    "user_id": userId,

  };
}
