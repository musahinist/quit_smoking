import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class SaveUp {
  final String? title;
  final String? note;
  final double? price;
  final String? link;
  final bool? purchased;

  const SaveUp({
    this.title,
    this.note,
    this.price,
    this.link,
    this.purchased,
  });

  @override
  String toString() {
    return 'SaveUp(title: $title, note: $note, price: $price, link: $link, purchased: $purchased)';
  }

  factory SaveUp.fromJson(Map<String, dynamic> json) => SaveUp(
        title: json['title'] as String?,
        note: json['note'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        link: json['link'] as String?,
        purchased: json['purchased'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'note': note,
        'price': price,
        'link': link,
        'purchased': purchased,
      };

  SaveUp copyWith({
    String? title,
    String? note,
    double? price,
    String? link,
    bool? purchased,
  }) {
    return SaveUp(
      title: title ?? this.title,
      note: note ?? this.note,
      price: price ?? this.price,
      link: link ?? this.link,
      purchased: purchased ?? this.purchased,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SaveUp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      title.hashCode ^
      note.hashCode ^
      price.hashCode ^
      link.hashCode ^
      purchased.hashCode;
}
