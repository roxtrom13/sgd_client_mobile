// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduledService _$ScheduledServiceFromJson(Map<String, dynamic> json) {
  return ScheduledService(
    json['id'] as int,
    json['service'] as int,
    json['technician'] as int,
    json['date'] as String,
    json['time'] as String,
    json['address'] as String,
    json['latitude'] as String,
    json['longitude'] as String,
    json['reference'] as String,
  );
}

Map<String, dynamic> _$ScheduledServiceToJson(ScheduledService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'technician': instance.technician,
      'date': instance.date,
      'time': instance.time,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'reference': instance.reference,
    };
