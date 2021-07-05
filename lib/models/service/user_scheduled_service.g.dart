// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_scheduled_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserScheduledService _$UserScheduledServiceFromJson(Map<String, dynamic> json) {
  return UserScheduledService(
    json['id'] as int,
    Service.fromJson(json['service'] as Map<String, dynamic>),
    Technician.fromJson(json['technician'] as Map<String, dynamic>),
    json['date'] as String,
    json['time'] as String,
    json['gradable'] as bool,
    json['address'] as String?,
    json['reference'] as String?,
  );
}

Map<String, dynamic> _$UserScheduledServiceToJson(
        UserScheduledService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'technician': instance.technician,
      'date': instance.date,
      'time': instance.time,
      'gradable': instance.gradable,
      'address': instance.address,
      'reference': instance.reference,
    };
