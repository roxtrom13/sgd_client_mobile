// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int?,
    json['username'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['email'] as String,
    json['photo'] as String?,
    (json['groups'] as List<dynamic>)
        .map((e) => Group.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'photo': instance.photo,
      'groups': instance.groups.map((e) => e.toJson()).toList(),
    };

LoggedUser _$LoggedUserFromJson(Map<String, dynamic> json) {
  return LoggedUser(
    json['refresh'] as String,
    json['access'] as String,
    User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoggedUserToJson(LoggedUser instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
      'user': instance.user.toJson(),
    };
