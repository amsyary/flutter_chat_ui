// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      createdAt: Room._dateTimeFromJson(json['createdAt']),
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String?,
      lastMessages: (json['lastMessages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      name: json['name'] as String?,
      type: $enumDecodeNullable(_$RoomTypeEnumMap, json['type']),
      updatedAt: Room._dateTimeFromJson(json['updatedAt']),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSpecial: json['isSpecial'] as bool?,
      userIds:
          (json['userIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'createdAt': Room._dateTimeToJson(instance.createdAt),
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'lastMessages': instance.lastMessages,
      'metadata': instance.metadata,
      'name': instance.name,
      'type': _$RoomTypeEnumMap[instance.type],
      'updatedAt': Room._dateTimeToJson(instance.updatedAt),
      'users': instance.users,
      'isSpecial': instance.isSpecial,
      'userIds': instance.userIds,
    };

const _$RoomTypeEnumMap = {
  RoomType.channel: 'channel',
  RoomType.direct: 'direct',
  RoomType.group: 'group',
};
