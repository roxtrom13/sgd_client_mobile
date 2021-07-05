import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "service.g.dart";

@JsonSerializable()
class Service extends Equatable {
  final int id;
  final String name;

  Service(this.id, this.name);

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);

  @override
  List<Object?> get props => <Object?>[id];
}
