import 'package:flutter/widgets.dart';
import 'package:flutter_chat_ui/src/types/types_export.dart' as types;

/// Used to make room accessible through the widget tree
class InheritedRoom extends InheritedWidget {
  /// Creates [InheritedRoom]
  const InheritedRoom({
    super.key,
    required super.child,
    required this.room,
  });

  /// Room to pass through the widget tree
  final types.Room? room;

  /// Get [Room] from the closest [InheritedRoom] instance up the tree
  /// Returns null if no [InheritedRoom] is found or if room is null
  static types.Room? getRoomFromContext(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedRoom>()?.room;
  }

  @override
  bool updateShouldNotify(InheritedRoom oldWidget) {
    if (room == null && oldWidget.room == null) return false;
    if (room == null || oldWidget.room == null) return true;
    return room!.hashCode != oldWidget.room!.hashCode;
  }
}
