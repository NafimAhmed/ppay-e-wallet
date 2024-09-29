

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
  int? status;
  bool? success;
  String? message;
  List<Datum>? data;

  TransactionModel({
     this.status,
     this.success,
     this.message,
     this.data,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
  String transactionType;
  int transactionAmount;
  String transactionId;
  String transactionDate;
  int userId;
  int receiverUserId;
  User user;
  User receiverUser;

  Datum({
    required this.id,
    required this.transactionType,
    required this.transactionAmount,
    required this.transactionId,
    required this.transactionDate,
    required this.userId,
    required this.receiverUserId,
    required this.user,
    required this.receiverUser,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    transactionType: json["transaction_type"]!,
    transactionAmount: json["transaction_amount"],
    transactionId: json["transaction_id"],
    transactionDate: json["transaction_date"],
    userId: json["user_id"],
    receiverUserId: json["receiver_user_id"],
    user: User.fromJson(json["User"]),
    receiverUser: User.fromJson(json["ReceiverUser"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transaction_type": transactionType,
    "transaction_amount": transactionAmount,
    "transaction_id": transactionId,
    "transaction_date": transactionDate,
    "user_id": userId,
    "receiver_user_id": receiverUserId,
    "User": user.toJson(),
    "ReceiverUser": receiverUser.toJson(),
  };
}

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  dynamic emailVerifiedAt;
  String password;
  String docsType;
  String identificationNumber;
  dynamic dob;
  String streetInfo;
  String postCode;
  dynamic deviceToken;
  String nationality;
  String phoneNumber;
  String address1;
  String address2;
  dynamic rememberToken;
  dynamic otpVerifiedInd;
  dynamic otpCode;
  dynamic profilePic;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.password,
    required this.docsType,
    required this.identificationNumber,
    required this.dob,
    required this.streetInfo,
    required this.postCode,
    required this.deviceToken,
    required this.nationality,
    required this.phoneNumber,
    required this.address1,
    required this.address2,
    required this.rememberToken,
    required this.otpVerifiedInd,
    required this.otpCode,
    required this.profilePic,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"]!,
    lastName: json["last_name"]!,
    email: json["email"]!,
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"]!,
    docsType: json["docs_type"]!,
    identificationNumber: json["identification_number"],
    dob: json["dob"],
    streetInfo: json["street_info"]!,
    postCode: json["post_code"],
    deviceToken: json["device_token"],
    nationality: json["nationality"]!,
    phoneNumber: json["phone_number"],
    address1: json["address_1"]!,
    address2: json["address_2"]!,
    rememberToken: json["remember_token"],
    otpVerifiedInd: json["otp_verified_ind"],
    otpCode: json["otp_code"],
    profilePic: json["profile_pic"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "docs_type": docsType,
    "identification_number": identificationNumber,
    "dob": dob,
    "street_info": streetInfo,
    "post_code": postCode,
    "device_token": deviceToken,
    "nationality": nationality,
    "phone_number": phoneNumber,
    "address_1": address1,
    "address_2":address2,
    "remember_token": rememberToken,
    "otp_verified_ind": otpVerifiedInd,
    "otp_code": otpCode,
    "profile_pic": profilePic,
  };
}




















