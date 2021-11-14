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
    this.id,
    required this.nom,
    this.rate,
    required this.typePrestation,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String nom;
  int? rate;
  List<TypePrestations> typePrestation;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Prestation.fromJson(Map<String, dynamic> json) => Prestation(
        id: json["_id"],
        nom: json["nom"],
        rate: json["rate"],
        typePrestation: List<TypePrestations>.from(
            json["typePrestation"].map((x) => TypePrestations.fromJson(x))),
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
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class TypePrestations {
  TypePrestations({
    required this.nom,
    required this.photoUrl,
    this.id,
  });

  String nom;
  String photoUrl;
  String? id;

  factory TypePrestations.fromJson(Map<String, dynamic> json) =>
      TypePrestations(
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
