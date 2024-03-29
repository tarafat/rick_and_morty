import 'package:equatable/equatable.dart';

class Location with EquatableMixin {
  Location({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.created,
  });
  String? id;
  String? name;
  String? type;
  String? dimension;
  DateTime? created;

  @override
  List<Object?> get props => [
        name,
        id,
        type,
        dimension,
        created,
      ];
}
