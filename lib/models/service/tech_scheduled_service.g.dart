// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tech_scheduled_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechScheduledService _$TechScheduledServiceFromJson(Map<String, dynamic> json) {
  return TechScheduledService(
    json['id'] as int,
    Service.fromJson(json['service'] as Map<String, dynamic>),
    Client.fromJson(json['client'] as Map<String, dynamic>),
    json['date'] as String,
    json['time'] as String,
    json['address'] as String?,
    json['reference'] as String?,
  );
}

Map<String, dynamic> _$TechScheduledServiceToJson(
        TechScheduledService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'client': instance.client,
      'date': instance.date,
      'time': instance.time,
      'address': instance.address,
      'reference': instance.reference,
    };
