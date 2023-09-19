// To parse this JSON data, do
//
//     final countriesResponseModel = countriesResponseModelFromJson(jsonString);

import 'dart:convert';

CountriesResponseModel countriesResponseModelFromJson(String str) =>
    CountriesResponseModel.fromJson(json.decode(str));

String countriesResponseModelToJson(CountriesResponseModel data) =>
    json.encode(data.toJson());

class CountriesResponseModel {
  String status;
  String message;
  List<Datum> data;

  CountriesResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CountriesResponseModel.fromJson(Map<String, dynamic> json) =>
      CountriesResponseModel(
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
