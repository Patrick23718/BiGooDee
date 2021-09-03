// To parse this JSON data, do
//
//     final tarification = tarificationFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Tarification> tarificationFromJson(String str) => List<Tarification>.from(
    json.decode(str).map((x) => Tarification.fromJson(x)));

String tarificationToJson(List<Tarification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tarification {
  Tarification({
    required this.prestation,
    required this.uid,
    required this.prix,
    required this.nom,
    required this.photoUrl,
  });

  String prestation;
  String uid;
  double prix;
  String nom;
  String photoUrl;

  factory Tarification.fromJson(Map<String, dynamic> json) => Tarification(
        prestation: json["prestation"],
        uid: json["uid"],
        prix: json["prix"].toDouble(),
        nom: json["nom"],
        photoUrl: json["photoURL"],
      );

  Map<String, dynamic> toJson() => {
        "prestation": prestation,
        "uid": uid,
        "prix": prix,
        "nom": nom,
        "photoURL": photoUrl,
      };
}
