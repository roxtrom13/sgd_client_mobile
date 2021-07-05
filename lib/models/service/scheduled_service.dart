import 'package:json_annotation/json_annotation.dart';

part "scheduled_service.g.dart";

@JsonSerializable()
class ScheduledService {
  final int id;
  final int service;
  final int technician;
  final String date;
  final String time;
  final String address;
  final String latitude;
  final String longitude;
  final String reference;

  ScheduledService(this.id, this.service, this.technician, this.date, this.time, this.address, this.latitude, this.longitude, this.reference);

  factory ScheduledService.fromJson(Map<String, dynamic> json) => _$ScheduledServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduledServiceToJson(this);
}
