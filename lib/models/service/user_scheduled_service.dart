import 'package:json_annotation/json_annotation.dart';
import 'package:sgd_client_mobile/models/service/user_scheduled_service/service.dart';
import 'package:sgd_client_mobile/models/service/user_scheduled_service/technician.dart';

part "user_scheduled_service.g.dart";

@JsonSerializable()
class UserScheduledService {
  final int id;
  final Service service;
  final Technician technician;
  final String date;
  final String time;
  final bool gradable;
  final String? address;
  final String? reference;

  UserScheduledService(this.id, this.service, this.technician, this.date,
      this.time, this.gradable, this.address, this.reference);

  factory UserScheduledService.fromJson(Map<String, dynamic> json) =>
      _$UserScheduledServiceFromJson(json);

  Map<String, dynamic> toJson() => _$UserScheduledServiceToJson(this);
}
