///
//  Generated code. Do not modify.
//  source: sgd.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use okResponseDescriptor instead')
const OkResponse$json = const {
  '1': 'OkResponse',
  '2': const [
    const {'1': 'ok', '3': 1, '4': 1, '5': 8, '10': 'ok'},
  ],
};

/// Descriptor for `OkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List okResponseDescriptor = $convert.base64Decode('CgpPa1Jlc3BvbnNlEg4KAm9rGAEgASgIUgJvaw==');
@$core.Deprecated('Use notificationRequestDescriptor instead')
const NotificationRequest$json = const {
  '1': 'NotificationRequest',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 5, '10': 'user'},
  ],
};

/// Descriptor for `NotificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationRequestDescriptor = $convert.base64Decode('ChNOb3RpZmljYXRpb25SZXF1ZXN0EhIKBHVzZXIYASABKAVSBHVzZXI=');
@$core.Deprecated('Use notificationResponseDescriptor instead')
const NotificationResponse$json = const {
  '1': 'NotificationResponse',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `NotificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationResponseDescriptor = $convert.base64Decode('ChROb3RpZmljYXRpb25SZXNwb25zZRIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');
@$core.Deprecated('Use sendNotificationRequestDescriptor instead')
const SendNotificationRequest$json = const {
  '1': 'SendNotificationRequest',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 5, '10': 'user'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SendNotificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendNotificationRequestDescriptor = $convert.base64Decode('ChdTZW5kTm90aWZpY2F0aW9uUmVxdWVzdBISCgR1c2VyGAEgASgFUgR1c2VyEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use botRequestDescriptor instead')
const BotRequest$json = const {
  '1': 'BotRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `BotRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botRequestDescriptor = $convert.base64Decode('CgpCb3RSZXF1ZXN0EhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use botResponseDescriptor instead')
const BotResponse$json = const {
  '1': 'BotResponse',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `BotResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botResponseDescriptor = $convert.base64Decode('CgtCb3RSZXNwb25zZRIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');
