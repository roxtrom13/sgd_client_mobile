///
//  Generated code. Do not modify.
//  source: sgd.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'sgd.pb.dart' as $0;
export 'sgd.pb.dart';

class SGDClient extends $grpc.Client {
  static final _$notifications =
      $grpc.ClientMethod<$0.NotificationRequest, $0.NotificationResponse>(
          '/sgd_grpc.SGD/Notifications',
          ($0.NotificationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.NotificationResponse.fromBuffer(value));
  static final _$sendNotification =
      $grpc.ClientMethod<$0.SendNotificationRequest, $0.OkResponse>(
          '/sgd_grpc.SGD/SendNotification',
          ($0.SendNotificationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.OkResponse.fromBuffer(value));
  static final _$bot = $grpc.ClientMethod<$0.BotRequest, $0.BotResponse>(
      '/sgd_grpc.SGD/Bot',
      ($0.BotRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.BotResponse.fromBuffer(value));

  SGDClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.NotificationResponse> notifications(
      $0.NotificationRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$notifications, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.OkResponse> sendNotification(
      $0.SendNotificationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendNotification, request, options: options);
  }

  $grpc.ResponseFuture<$0.BotResponse> bot($0.BotRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$bot, request, options: options);
  }
}

abstract class SGDServiceBase extends $grpc.Service {
  $core.String get $name => 'sgd_grpc.SGD';

  SGDServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.NotificationRequest, $0.NotificationResponse>(
            'Notifications',
            notifications_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.NotificationRequest.fromBuffer(value),
            ($0.NotificationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendNotificationRequest, $0.OkResponse>(
        'SendNotification',
        sendNotification_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SendNotificationRequest.fromBuffer(value),
        ($0.OkResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BotRequest, $0.BotResponse>(
        'Bot',
        bot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BotRequest.fromBuffer(value),
        ($0.BotResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.NotificationResponse> notifications_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.NotificationRequest> request) async* {
    yield* notifications(call, await request);
  }

  $async.Future<$0.OkResponse> sendNotification_Pre($grpc.ServiceCall call,
      $async.Future<$0.SendNotificationRequest> request) async {
    return sendNotification(call, await request);
  }

  $async.Future<$0.BotResponse> bot_Pre(
      $grpc.ServiceCall call, $async.Future<$0.BotRequest> request) async {
    return bot(call, await request);
  }

  $async.Stream<$0.NotificationResponse> notifications(
      $grpc.ServiceCall call, $0.NotificationRequest request);
  $async.Future<$0.OkResponse> sendNotification(
      $grpc.ServiceCall call, $0.SendNotificationRequest request);
  $async.Future<$0.BotResponse> bot(
      $grpc.ServiceCall call, $0.BotRequest request);
}
