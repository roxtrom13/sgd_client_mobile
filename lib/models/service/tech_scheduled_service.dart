import 'package:json_annotation/json_annotation.dart';
import 'package:sgd_client_mobile/models/service/tech_scheduled_service/client.dart';
import 'package:sgd_client_mobile/models/service/user_scheduled_service/service.dart';

part "tech_scheduled_service.g.dart";

@JsonSerializable()
class TechScheduledService {
  final int id;
  final Service service;
  final Client client;
  final String date;
  final String time;
  final String? address;
  final String? reference;

  TechScheduledService(this.id, this.service, this.client, this.date,
      this.time, this.address, this.reference);

  factory TechScheduledService.fromJson(Map<String, dynamic> json) =>
      _$TechScheduledServiceFromJson(json);

  Map<String, dynamic> toJson() => _$TechScheduledServiceToJson(this);
}
