import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class Preferences {
  final String? language;
  final String? theme;
  final bool? notifications;
  final bool? sounds;
  final bool? vibration;

  const Preferences({
    this.language,
    this.theme,
    this.notifications,
    this.sounds,
    this.vibration,
  });

  @override
  String toString() {
    return 'Preferences(language: $language, theme: $theme, notifications: $notifications, sounds: $sounds, vibration: $vibration)';
  }

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
        language: json['language'] as String?,
        theme: json['theme'] as String?,
        notifications: json['notifications'] as bool?,
        sounds: json['sounds'] as bool?,
        vibration: json['vibration'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'language': language,
        'theme': theme,
        'notifications': notifications,
        'sounds': sounds,
        'vibration': vibration,
      };

  Preferences copyWith({
    String? language,
    String? theme,
    bool? notifications,
    bool? sounds,
    bool? vibration,
  }) {
    return Preferences(
      language: language ?? this.language,
      theme: theme ?? this.theme,
      notifications: notifications ?? this.notifications,
      sounds: sounds ?? this.sounds,
      vibration: vibration ?? this.vibration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Preferences) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      language.hashCode ^
      theme.hashCode ^
      notifications.hashCode ^
      sounds.hashCode ^
      vibration.hashCode;
}
