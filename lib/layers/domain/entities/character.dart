import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/layers/domain/entities/location.dart';

class Character with EquatableMixin {
  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.origin,
    this.location,
  });
  String? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  Location? origin;
  Location? location;

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
      ];

  bool get isAlive => status == 'Alive';
}
