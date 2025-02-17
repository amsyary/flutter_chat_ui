import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import '../message.dart';
import '../preview_data.dart' show PreviewData;
import '../user.dart' show User;
import 'partial_text.dart';

part 'text_message.g.dart';

/// A class that represents text message.
@JsonSerializable()
@immutable
class TextMessage extends Message {
  /// Creates a text message.
  const TextMessage({
    required User author,
    DateTime? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    this.previewData,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    Status? status,
    required this.text,
    MessageType? type,
    DateTime? updatedAt,
  }) : super(
          author,
          createdAt,
          id,
          metadata,
          remoteId,
          repliedMessage,
          roomId,
          status,
          type ?? MessageType.text,
          updatedAt,
        );

  /// Creates a full text message from a partial one.
  TextMessage.fromPartial({
    required User author,
    DateTime? createdAt,
    required String id,
    required PartialText partialText,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    Status? status,
    DateTime? updatedAt,
  })  : previewData = partialText.previewData,
        text = partialText.text,
        super(
          author,
          createdAt,
          id,
          partialText.metadata,
          remoteId,
          repliedMessage,
          roomId,
          status,
          MessageType.text,
          updatedAt,
        );

  /// Creates a text message from a map (decoded JSON).
  factory TextMessage.fromJson(Map<String, dynamic> json) {
    json['id'] = json['id'] ?? '';
    return _$TextMessageFromJson(json);
  }

  /// Converts a text message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$TextMessageToJson(this);

  /// Creates a copy of the text message with an updated data
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  /// [remoteId] and [updatedAt] with null values will nullify existing value.
  /// [status] and [text] with null values will be overwritten by previous values.
  /// [uri] is ignored for this message type.
  @override
  Message copyWith({
    Map<String, dynamic>? metadata,
    PreviewData? previewData,
    String? remoteId,
    Status? status,
    String? text,
    DateTime? updatedAt,
    String? uri,
  }) {
    return TextMessage(
      author: author,
      createdAt: createdAt,
      id: id,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
      previewData: previewData,
      remoteId: remoteId,
      repliedMessage: repliedMessage,
      roomId: roomId,
      status: status ?? this.status,
      text: text ?? this.text,
      updatedAt: updatedAt,
    );
  }

  /// Equatable props
  @override
  List<Object?> get props => [
        author,
        createdAt,
        id,
        metadata,
        previewData,
        remoteId,
        repliedMessage,
        roomId,
        status,
        text,
        updatedAt,
      ];

  /// See [PreviewData]
  final PreviewData? previewData;

  /// User's message
  final String text;
}
