import 'package:collection/collection.dart';

import 'daily_mood.dart';
import 'prefereces.dart';
import 'save_up.dart';

class User {
  final String? name;
  final String? email;
  final String? profilePhoto;
  final String? bio;
  final String? location;
  final String? quitDate;
  final int? dailyCigaretteCount;
  final int? cigarettePrice;
  final String? currency;
  final int? cigaretteAmountInPack;
  final int? smokingYears;
  final bool? termsAndPolicyOk;
  final int? challengeDurationInhours;
  final int? saveUpForSmth;
  final Prefereces? prefereces;
  final List<SaveUp>? saveUp;
  final List<String>? reasons;
  final List<DailyMood>? dailyMood;

  const User({
    this.name,
    this.email,
    this.profilePhoto,
    this.bio,
    this.location,
    this.quitDate,
    this.dailyCigaretteCount,
    this.cigarettePrice,
    this.currency,
    this.cigaretteAmountInPack,
    this.smokingYears,
    this.termsAndPolicyOk,
    this.challengeDurationInhours,
    this.saveUpForSmth,
    this.prefereces,
    this.saveUp,
    this.reasons,
    this.dailyMood,
  });

  @override
  String toString() {
    return 'User(name: $name, email: $email, profilePhoto: $profilePhoto, bio: $bio, location: $location, quitDate: $quitDate, dailyCigaretteCount: $dailyCigaretteCount, cigarettePrice: $cigarettePrice, currency: $currency, cigaretteAmountInPack: $cigaretteAmountInPack, smokingYears: $smokingYears, termsAndPolicyOk: $termsAndPolicyOk, challengeDurationInhours: $challengeDurationInhours, saveUpForSmth: $saveUpForSmth, prefereces: $prefereces, saveUp: $saveUp, reasons: $reasons, dailyMood: $dailyMood)';
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        email: json['email'] as String?,
        profilePhoto: json['profile_photo'] as String?,
        bio: json['bio'] as String?,
        location: json['location'] as String?,
        quitDate: json['quit_date'] as String?,
        dailyCigaretteCount: json['daily_cigarette_count'] as int?,
        cigarettePrice: json['cigarette_price'] as int?,
        currency: json['currency'] as String?,
        cigaretteAmountInPack: json['cigarette_amount_in_pack'] as int?,
        smokingYears: json['smoking_years'] as int?,
        termsAndPolicyOk: json['terms_and_policy_ok'] as bool?,
        challengeDurationInhours: json['challenge_duration_inhours'] as int?,
        saveUpForSmth: json['save_up_for_smth'] as int?,
        prefereces: json['prefereces'] == null
            ? null
            : Prefereces.fromJson(json['prefereces'] as Map<String, dynamic>),
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
        'quit_date': quitDate,
        'daily_cigarette_count': dailyCigaretteCount,
        'cigarette_price': cigarettePrice,
        'currency': currency,
        'cigarette_amount_in_pack': cigaretteAmountInPack,
        'smoking_years': smokingYears,
        'terms_and_policy_ok': termsAndPolicyOk,
        'challenge_duration_inhours': challengeDurationInhours,
        'save_up_for_smth': saveUpForSmth,
        'prefereces': prefereces?.toJson(),
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
    String? quitDate,
    int? dailyCigaretteCount,
    int? cigarettePrice,
    String? currency,
    int? cigaretteAmountInPack,
    int? smokingYears,
    bool? termsAndPolicyOk,
    int? challengeDurationInhours,
    int? saveUpForSmth,
    Prefereces? prefereces,
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
      quitDate: quitDate ?? this.quitDate,
      dailyCigaretteCount: dailyCigaretteCount ?? this.dailyCigaretteCount,
      cigarettePrice: cigarettePrice ?? this.cigarettePrice,
      currency: currency ?? this.currency,
      cigaretteAmountInPack:
          cigaretteAmountInPack ?? this.cigaretteAmountInPack,
      smokingYears: smokingYears ?? this.smokingYears,
      termsAndPolicyOk: termsAndPolicyOk ?? this.termsAndPolicyOk,
      challengeDurationInhours:
          challengeDurationInhours ?? this.challengeDurationInhours,
      saveUpForSmth: saveUpForSmth ?? this.saveUpForSmth,
      prefereces: prefereces ?? this.prefereces,
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
      quitDate.hashCode ^
      dailyCigaretteCount.hashCode ^
      cigarettePrice.hashCode ^
      currency.hashCode ^
      cigaretteAmountInPack.hashCode ^
      smokingYears.hashCode ^
      termsAndPolicyOk.hashCode ^
      challengeDurationInhours.hashCode ^
      saveUpForSmth.hashCode ^
      prefereces.hashCode ^
      saveUp.hashCode ^
      reasons.hashCode ^
      dailyMood.hashCode;
}
