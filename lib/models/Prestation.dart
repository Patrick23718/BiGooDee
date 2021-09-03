// To parse this JSON data, do
//
//     final prestation = prestationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Prestation> prestationFromJson(String str) =>
    List<Prestation>.from(json.decode(str).map((x) => Prestation.fromJson(x)));

String prestationToJson(List<Prestation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prestation {
  Prestation({
    required this.id,
    required this.nom,
    required this.rate,
    required this.typePrestation,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String nom;
  int rate;
  List<TypePrestation> typePrestation;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Prestation.fromJson(Map<String, dynamic> json) => Prestation(
        id: json["_id"],
        nom: json["nom"],
        rate: json["rate"],
        typePrestation: List<TypePrestation>.from(
            json["typePrestation"].map((x) => TypePrestation.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nom": nom,
        "rate": rate,
        "typePrestation":
            List<dynamic>.from(typePrestation.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class TypePrestation {
  TypePrestation({
    required this.nom,
    required this.photoUrl,
    required this.id,
  });

  String nom;
  String photoUrl;
  String id;

  factory TypePrestation.fromJson(Map<String, dynamic> json) => TypePrestation(
        nom: json["nom"],
        photoUrl: json["photoURL"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "nom": nom,
        "photoURL": photoUrl,
        "_id": id,
      };
}
