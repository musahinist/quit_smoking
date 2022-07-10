import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class DailyMood {
  final String? date;
  final int? cravings;
  final int? p1;
  final int? p2;
  final int? p3;
  final int? p4;
  final String? p1c;
  final String? p2c;
  final String? p3c;
  final String? p4c;

  const DailyMood({
    this.date,
    this.cravings,
    this.p1,
    this.p2,
    this.p3,
    this.p4,
    this.p1c,
    this.p2c,
    this.p3c,
    this.p4c,
  });

  @override
  String toString() {
    return 'DailyMood(date: $date, cravings: $cravings, p1: $p1, p2: $p2, p3: $p3, p4: $p4, p1c: $p1c, p2c: $p2c, p3c: $p3c, p4c: $p4c)';
  }

  factory DailyMood.fromJson(Map<String, dynamic> json) => DailyMood(
        date: json['date'] as String?,
        cravings: json['cravings'] as int?,
        p1: json['p1'] as int?,
        p2: json['p2'] as int?,
        p3: json['p3'] as int?,
        p4: json['p4'] as int?,
        p1c: json['p1c'] as String?,
        p2c: json['p2c'] as String?,
        p3c: json['p3c'] as String?,
        p4c: json['p4c'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'cravings': cravings,
        'p1': p1,
        'p2': p2,
        'p3': p3,
        'p4': p4,
        'p1c': p1c,
        'p2c': p2c,
        'p3c': p3c,
        'p4c': p4c,
      };

  DailyMood copyWith({
    String? date,
    int? cravings,
    int? p1,
    int? p2,
    int? p3,
    int? p4,
    String? p1c,
    String? p2c,
    String? p3c,
    String? p4c,
  }) {
    return DailyMood(
      date: date ?? this.date,
      cravings: cravings ?? this.cravings,
      p1: p1 ?? this.p1,
      p2: p2 ?? this.p2,
      p3: p3 ?? this.p3,
      p4: p4 ?? this.p4,
      p1c: p1c ?? this.p1c,
      p2c: p2c ?? this.p2c,
      p3c: p3c ?? this.p3c,
      p4c: p4c ?? this.p4c,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DailyMood) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      date.hashCode ^
      cravings.hashCode ^
      p1.hashCode ^
      p2.hashCode ^
      p3.hashCode ^
      p4.hashCode ^
      p1c.hashCode ^
      p2c.hashCode ^
      p3c.hashCode ^
      p4c.hashCode;
}
