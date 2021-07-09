import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "client.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class Client extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String photo;

  Client(this.id, this.firstName, this.lastName, this.phone, this.photo);

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);

  @override
  List<Object?> get props => <Object?>[id];
}
