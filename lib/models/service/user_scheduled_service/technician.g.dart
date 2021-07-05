// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Technician _$TechnicianFromJson(Map<String, dynamic> json) {
  return Technician(
    json['id'] as int,
    json['first_name'] as String,
    json['last_name'] as String,
    json['phone'] as String,
    json['photo'] as String,
  );
}

Map<String, dynamic> _$TechnicianToJson(Technician instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'photo': instance.photo,
    };
