import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// All possible roles user can have.
enum Role { admin, agent, moderator, user, doctor }

/// A class that represents user.
@JsonSerializable()
@immutable
class User extends Equatable {
  /// Creates a user.
  const User({
    this.displayName,
    required this.id,
    this.photoUrl,
    this.lastName,
    this.lastSeen,
    this.metadata,
    this.role,
    this.updatedAt,
  });

  /// Creates user from a map (decoded JSON).
  factory User.fromJson(Map<String, dynamic> json) {
    json['id'] = json['id'] ?? (json['uid'] ?? '');
    return _$UserFromJson(json);
  }

  /// Converts user to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// Creates a copy of the user with an updated data.
  /// [firstName], [photoUrl], [lastName], [lastSeen], [role] and [updatedAt]
  /// with null values will nullify existing values.
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  User copyWith({
    String? displayName,
    String? photoUrl,
    String? lastName,
    DateTime? lastSeen,
    Map<String, dynamic>? metadata,
    Role? role,
    DateTime? updatedAt,
  }) {
    return User(
      displayName: displayName,
      id: id,
      photoUrl: photoUrl,
      lastName: lastName,
      lastSeen: lastSeen,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
      role: role,
      updatedAt: updatedAt,
    );
  }

  /// Equatable props
  @override
  List<Object?> get props => [
        displayName,
        id,
        photoUrl,
        lastName,
        lastSeen,
        metadata,
        role,
        updatedAt
      ];

  /// First name of the user
  final String? displayName;

  /// Unique ID of the user
  final String id;

  /// Remote image URL representing user's avatar
  final String? photoUrl;

  /// Last name of the user
  final String? lastName;

  /// Timestamp when user was last visible, in ms
  @JsonKey(
      name: 'lastSeen', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime? lastSeen;

  /// Additional custom metadata or attributes related to the user
  final Map<String, dynamic>? metadata;

  /// User [Role]
  final Role? role;

  /// Updated user timestamp, in ms
  @JsonKey(
      name: 'updatedAt', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime? updatedAt;

  static DateTime? _dateTimeFromJson(dynamic timestamp) {
    if (timestamp == null) return null;
    if (timestamp is Timestamp) return timestamp.toDate();
    if (timestamp is Map) return null;
    return null;
  }

  static Timestamp? _dateTimeToJson(DateTime? dateTime) {
    if (dateTime == null) return null;
    return Timestamp.fromDate(dateTime);
  }
}
