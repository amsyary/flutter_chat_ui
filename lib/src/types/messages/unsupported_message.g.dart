// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsupported_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsupportedMessage _$UnsupportedMessageFromJson(Map<String, dynamic> json) =>
    UnsupportedMessage(
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      createdAt: Message.dateTimeFromJson(json['createdAt'] as Timestamp?),
      id: json['id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      remoteId: json['remoteId'] as String?,
      repliedMessage: json['repliedMessage'] == null
          ? null
          : Message.fromJson(json['repliedMessage'] as Map<String, dynamic>),
      roomId: json['roomId'] as String?,
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']),
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
      updatedAt: Message.dateTimeFromJson(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$UnsupportedMessageToJson(UnsupportedMessage instance) =>
    <String, dynamic>{
      'author': instance.author,
      'createdAt': Message.dateTimeToJson(instance.createdAt),
      'id': instance.id,
      'metadata': instance.metadata,
      'remoteId': instance.remoteId,
      'repliedMessage': instance.repliedMessage,
      'roomId': instance.roomId,
      'status': _$StatusEnumMap[instance.status],
      'type': _$MessageTypeEnumMap[instance.type]!,
      'updatedAt': Message.dateTimeToJson(instance.updatedAt),
    };

const _$StatusEnumMap = {
  Status.delivered: 'delivered',
  Status.error: 'error',
  Status.seen: 'seen',
  Status.sending: 'sending',
  Status.sent: 'sent',
};

const _$MessageTypeEnumMap = {
  MessageType.custom: 'custom',
  MessageType.file: 'file',
  MessageType.image: 'image',
  MessageType.text: 'text',
  MessageType.unsupported: 'unsupported',
};
