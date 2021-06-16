import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "group.g.dart";

@JsonSerializable()
class Group extends Equatable {
  final int id;
  final String name;

  Group(this.id, this.name);

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  List<Object?> get props => <Object?>[id];
}
