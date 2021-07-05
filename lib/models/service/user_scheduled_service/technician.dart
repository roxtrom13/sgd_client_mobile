import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "technician.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class Technician extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String photo;

  Technician(this.id, this.firstName, this.lastName, this.phone, this.photo);

  factory Technician.fromJson(Map<String, dynamic> json) => _$TechnicianFromJson(json);
  Map<String, dynamic> toJson() => _$TechnicianToJson(this);

  @override
  List<Object?> get props => <Object?>[id];
}
