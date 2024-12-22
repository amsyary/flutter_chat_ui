// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      displayName: json['displayName'] as String?,
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String?,
      lastName: json['lastName'] as String?,
      lastSeen: User._dateTimeFromJson(json['lastSeen']),
      metadata: json['metadata'] as Map<String, dynamic>?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      updatedAt: User._dateTimeFromJson(json['updatedAt']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'lastName': instance.lastName,
      'lastSeen': User._dateTimeToJson(instance.lastSeen),
      'metadata': instance.metadata,
      'role': _$RoleEnumMap[instance.role],
      'updatedAt': User._dateTimeToJson(instance.updatedAt),
    };

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.agent: 'agent',
  Role.moderator: 'moderator',
  Role.user: 'user',
  Role.doctor: 'doctor',
};
