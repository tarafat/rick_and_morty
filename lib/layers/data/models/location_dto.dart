import 'dart:convert';

import 'package:rick_and_morty/layers/domain/entities/location.dart';

final class LocationDto extends Location {
  LocationDto({
    super.name,
    super.id,
    super.created,
    super.dimension,
    super.type,
  });

  factory LocationDto.fromRawJson(String str) =>
      LocationDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationDto.fromJson(Map<String, dynamic> json) => LocationDto(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        dimension: json['dimension'],
        created:
            json['created'] == null ? null : DateTime.parse(json['created']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'dimension': dimension,
        'created': created?.toIso8601String(),
      };

  Location toLocation() {
    return Location(
      name: name,
      id: id,
    );
  }
}
