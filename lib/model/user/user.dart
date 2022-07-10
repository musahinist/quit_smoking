import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'daily_mood.dart';
import 'preferences.dart';
import 'save_up.dart';

@immutable
class User {
  final String? name;
  final String? email;
  final String? profilePhoto;
  final String? bio;
  final String? location;
  final bool? firstSetup;
  final DateTime? quitDate;
  final int? dailyCigaretteCount;
  final double? cigarettePriceInPack;
  final String? currency;
  final int? cigaretteAmountInPack;
  final int? smokingYears;
  final bool? termsAndPolicyOk;
  final int? challengeDurationInhours;
  final double? saveUpForSmth;
  final Preferences? preferences;
  final List<SaveUp>? saveUp;
  final List<String>? reasons;
  final List<DailyMood>? dailyMood;

  const User({
    this.name,
    this.email,
    this.profilePhoto,
    this.bio,
    this.location,
    this.firstSetup,
    this.quitDate,
    this.dailyCigaretteCount,
    this.cigarettePriceInPack,
    this.currency,
    this.cigaretteAmountInPack,
    this.smokingYears,
    this.termsAndPolicyOk,
    this.challengeDurationInhours,
    this.saveUpForSmth,
    this.preferences,
    this.saveUp,
    this.reasons,
    this.dailyMood,
  });

  @override
  String toString() {
    return 'User(name: $name, email: $email, profilePhoto: $profilePhoto, bio: $bio, location: $location, firstSetup: $firstSetup, quitDate: $quitDate, dailyCigaretteCount: $dailyCigaretteCount, cigarettePriceInPack: $cigarettePriceInPack, currency: $currency, cigaretteAmountInPack: $cigaretteAmountInPack, smokingYears: $smokingYears, termsAndPolicyOk: $termsAndPolicyOk, challengeDurationInhours: $challengeDurationInhours, saveUpForSmth: $saveUpForSmth, preferences: $preferences, saveUp: $saveUp, reasons: $reasons, dailyMood: $dailyMood)';
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        email: json['email'] as String?,
        profilePhoto: json['profile_photo'] as String?,
        bio: json['bio'] as String?,
        location: json['location'] as String?,
        firstSetup: json['first_setup'] as bool?,
        quitDate: json['quit_date'] == null
            ? null
            : DateTime.parse(json['quit_date'] as String),
        dailyCigaretteCount: json['daily_cigarette_count'] as int?,
        cigarettePriceInPack:
            (json['cigarette_price_in_pack'] as num?)?.toDouble(),
        currency: json['currency'] as String?,
        cigaretteAmountInPack: json['cigarette_amount_in_pack'] as int?,
        smokingYears: json['smoking_years'] as int?,
        termsAndPolicyOk: json['terms_and_policy_ok'] as bool?,
        challengeDurationInhours: json['challenge_duration_inhours'] as int?,
        saveUpForSmth: (json['save_up_for_smth'] as num?)?.toDouble(),
        preferences: json['preferences'] == null
            ? null
            : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
        saveUp: (json['save_up'] as List<dynamic>?)
            ?.map((e) => SaveUp.fromJson(e as Map<String, dynamic>))
            .toList(),
        reasons: json['reasons'] as List<String>?,
        dailyMood: (json['daily_mood'] as List<dynamic>?)
            ?.map((e) => DailyMood.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'profile_photo': profilePhoto,
        'bio': bio,
        'location': location,
        'first_setup': firstSetup,
        'quit_date': quitDate?.toIso8601String(),
        'daily_cigarette_count': dailyCigaretteCount,
        'cigarette_price_in_pack': cigarettePriceInPack,
        'currency': currency,
        'cigarette_amount_in_pack': cigaretteAmountInPack,
        'smoking_years': smokingYears,
        'terms_and_policy_ok': termsAndPolicyOk,
        'challenge_duration_inhours': challengeDurationInhours,
        'save_up_for_smth': saveUpForSmth,
        'preferences': preferences?.toJson(),
        'save_up': saveUp?.map((e) => e.toJson()).toList(),
        'reasons': reasons,
        'daily_mood': dailyMood?.map((e) => e.toJson()).toList(),
      };

  User copyWith({
    String? name,
    String? email,
    String? profilePhoto,
    String? bio,
    String? location,
    bool? firstSetup,
    DateTime? quitDate,
    int? dailyCigaretteCount,
    double? cigarettePriceInPack,
    String? currency,
    int? cigaretteAmountInPack,
    int? smokingYears,
    bool? termsAndPolicyOk,
    int? challengeDurationInhours,
    double? saveUpForSmth,
    Preferences? preferences,
    List<SaveUp>? saveUp,
    List<String>? reasons,
    List<DailyMood>? dailyMood,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      firstSetup: firstSetup ?? this.firstSetup,
      quitDate: quitDate ?? this.quitDate,
      dailyCigaretteCount: dailyCigaretteCount ?? this.dailyCigaretteCount,
      cigarettePriceInPack: cigarettePriceInPack ?? this.cigarettePriceInPack,
      currency: currency ?? this.currency,
      cigaretteAmountInPack:
          cigaretteAmountInPack ?? this.cigaretteAmountInPack,
      smokingYears: smokingYears ?? this.smokingYears,
      termsAndPolicyOk: termsAndPolicyOk ?? this.termsAndPolicyOk,
      challengeDurationInhours:
          challengeDurationInhours ?? this.challengeDurationInhours,
      saveUpForSmth: saveUpForSmth ?? this.saveUpForSmth,
      preferences: preferences ?? this.preferences,
      saveUp: saveUp ?? this.saveUp,
      reasons: reasons ?? this.reasons,
      dailyMood: dailyMood ?? this.dailyMood,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
      profilePhoto.hashCode ^
      bio.hashCode ^
      location.hashCode ^
      firstSetup.hashCode ^
      quitDate.hashCode ^
      dailyCigaretteCount.hashCode ^
      cigarettePriceInPack.hashCode ^
      currency.hashCode ^
      cigaretteAmountInPack.hashCode ^
      smokingYears.hashCode ^
      termsAndPolicyOk.hashCode ^
      challengeDurationInhours.hashCode ^
      saveUpForSmth.hashCode ^
      preferences.hashCode ^
      saveUp.hashCode ^
      reasons.hashCode ^
      dailyMood.hashCode;
}
