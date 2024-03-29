import 'dart:convert';

import 'package:rick_and_morty/layers/data/models/location_dto.dart';
import 'package:rick_and_morty/layers/domain/entities/character.dart';

final class CharacterDto extends Character {
  CharacterDto({
    super.id,
    super.name,
    super.status,
    super.species,
    super.type,
    super.gender,
    super.origin,
    super.location,
    super.image,
  });

  factory CharacterDto.fromRawJson(String str) =>
      CharacterDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory CharacterDto.fromMap(Map<dynamic, dynamic> json) => CharacterDto(
        id: json['id'] as String,
        name: json['name'] as String,
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin: json['origin'] == null
            ? null
            : LocationDto.fromJson(json['origin']),
        location: json['location'] == null
            ? null
            : LocationDto.fromJson(json['location']),
        image: json['image'],
      );

  factory CharacterDto.fromMapDb(Map<dynamic, dynamic> json) => CharacterDto(
        id: json['id'] as String,
        name: json['name'] as String,
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin: json['origin'] == null
            ? null
            : LocationDto.fromRawJson(json['origin']),
        location: json['location'] == null
            ? null
            : LocationDto.fromRawJson(json['location']),
        image: json['image'],
      );

  Map<String, Object?> toMap() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
        'origin': origin != null ? jsonEncode(origin) : null,
        'location': location != null ? jsonEncode(location) : null,
        'image': image,
      };
}

class InfoClass {
  int? count;
  dynamic next;
  int? pages;

  InfoClass({
    this.count,
    this.next,
    this.pages,
  });

  InfoClass copyWith({
    int? count,
    dynamic next,
    int? pages,
  }) =>
      InfoClass(
        count: count ?? this.count,
        next: next ?? this.next,
        pages: pages ?? this.pages,
      );

  factory InfoClass.fromRawJson(String str) =>
      InfoClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InfoClass.fromJson(Map<String, dynamic> json) => InfoClass(
        count: json["count"],
        next: json["next"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "pages": pages,
      };
}
