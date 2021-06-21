import 'package:json_annotation/json_annotation.dart';

part "service.g.dart";

@JsonSerializable()
class Service {
  final int id;
  final String name;
  final String description;
  final String image;

  Service(this.id, this.name, this.description, this.image);

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
