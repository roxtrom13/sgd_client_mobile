import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";
import "package:sgd_client_mobile/models/auth/group.dart";

part "user.g.dart";

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class User extends Equatable {
  final int? id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String? photo;
  final List<Group> groups;

  User(
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.photo,
    this.groups,
  );

  @override
  List<Object?> get props =>
      <Object?>[id, username, firstName, lastName, email, photo];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class LoggedUser extends Equatable {
  final String refresh;
  final String access;
  final User user;

  LoggedUser(
    this.refresh,
    this.access,
    this.user,
  );

  @override
  List<Object?> get props => <Object?>[refresh, access, user];

  factory LoggedUser.fromJson(Map<String, dynamic> json) =>
      _$LoggedUserFromJson(json);
  Map<String, dynamic> toJson() => _$LoggedUserToJson(this);
}
