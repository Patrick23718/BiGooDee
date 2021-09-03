// To parse this JSON data, do
//
//     final ville = villeFromJson(jsonString);

import 'dart:convert';

List<Ville> villeFromJson(String str) =>
    List<Ville>.from(json.decode(str).map((x) => Ville.fromJson(x)));

String villeToJson(List<Ville> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ville {
  Ville({
    required this.id,
    required this.ville,
    required this.subVille,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String ville;
  List<String> subVille;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Ville.fromJson(Map<String, dynamic> json) => Ville(
        id: json["_id"],
        ville: json["ville"],
        subVille: List<String>.from(json["subVille"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ville": ville,
        "subVille": List<dynamic>.from(subVille.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
