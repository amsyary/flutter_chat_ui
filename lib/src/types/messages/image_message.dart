import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import '../message.dart';
import '../preview_data.dart' show PreviewData;
import '../user.dart' show User;
import 'partial_image.dart';

part 'image_message.g.dart';

/// A class that represents image message.
@JsonSerializable()
@immutable
class ImageMessage extends Message {
  /// Creates an image message.
  const ImageMessage({
    required User author,
    DateTime? createdAt,
    this.height,
    required String id,
    Map<String, dynamic>? metadata,
    required this.name,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    required this.size,
    Status? status,
    MessageType? type,
    DateTime? updatedAt,
    required this.uri,
    this.width,
  }) : super(
          author,
          createdAt,
          id,
          metadata,
          remoteId,
          repliedMessage,
          roomId,
          status,
          type ?? MessageType.image,
          updatedAt,
        );

  /// Creates a full image message from a partial one.
  ImageMessage.fromPartial({
    required User author,
    DateTime? createdAt,
    required String id,
    required PartialImage partialImage,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    Status? status,
    DateTime? updatedAt,
  })  : height = partialImage.height,
        name = partialImage.name,
        size = partialImage.size,
        uri = partialImage.uri,
        width = partialImage.width,
        super(
          author,
          createdAt,
          id,
          partialImage.metadata,
          remoteId,
          repliedMessage,
          roomId,
          status,
          MessageType.image,
          updatedAt,
        );

  /// Creates an image message from a map (decoded JSON).
  factory ImageMessage.fromJson(Map<String, dynamic> json) =>
      _$ImageMessageFromJson(json);

  /// Converts an image message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$ImageMessageToJson(this);

  /// Creates a copy of the image message with an updated data
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  /// [previewData] is ignored for this message type.
  /// [remoteId] and [updatedAt] with null values will nullify existing value.
  /// [status] and [uri] with null values will be overwritten by previous values.
  /// [text] is ignored for this message type.
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
    return ImageMessage(
      author: author,
      createdAt: createdAt,
      height: height,
      id: id,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
      name: name,
      remoteId: remoteId,
      repliedMessage: repliedMessage,
      roomId: roomId,
      size: size,
      status: status ?? this.status,
      updatedAt: updatedAt,
      uri: uri ?? this.uri,
      width: width,
    );
  }

  /// Equatable props
  @override
  List<Object?> get props => [
        author,
        createdAt,
        height,
        id,
        metadata,
        name,
        remoteId,
        repliedMessage,
        roomId,
        size,
        status,
        updatedAt,
        uri,
        width,
      ];

  /// Image height in pixels
  final double? height;

  /// The name of the image
  final String name;

  /// Size of the image in bytes
  final num size;

  /// The image source (either a remote URL or a local resource)
  final String uri;

  /// Image width in pixels
  final double? width;
}
