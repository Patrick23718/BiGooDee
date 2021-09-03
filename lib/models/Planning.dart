// To parse this JSON data, do
//
//     final planning = planningFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Planning> planningFromJson(String str) =>
    List<Planning>.from(json.decode(str).map((x) => Planning.fromJson(x)));

String planningToJson(List<Planning> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Planning {
  Planning({
    required this.id,
    required this.uid,
    required this.date,
    required this.plage,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String uid;
  DateTime date;
  String plage;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Planning.fromJson(Map<String, dynamic> json) => Planning(
        id: json["_id"],
        uid: json["uid"],
        date: DateTime.parse(json["date"]),
        plage: json["plage"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "uid": uid,
        "date": date.toIso8601String(),
        "plage": plage,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
