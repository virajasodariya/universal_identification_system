// To parse this JSON data, do
//
//     final statesResponseModel = statesResponseModelFromJson(jsonString);

import 'dart:convert';

StatesResponseModel statesResponseModelFromJson(String str) =>
    StatesResponseModel.fromJson(json.decode(str));

String statesResponseModelToJson(StatesResponseModel data) =>
    json.encode(data.toJson());

class StatesResponseModel {
  String status;
  String message;
  List<Datum> data;

  StatesResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory StatesResponseModel.fromJson(Map<String, dynamic> json) =>
      StatesResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String name;

  Datum({
    required this.id,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
