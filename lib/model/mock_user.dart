import 'package:quit_smoking/model/user/daily_mood.dart';
import 'package:quit_smoking/model/user/prefereces.dart';
import 'package:quit_smoking/model/user/save_up.dart';

import 'user/user.dart';

User mockUser = const User(
  name: 'mshn',
  email: 'sahinmusa@gmail.com',
  profilePhoto: '',
  bio: 'about me my bio',
  location: 'Turkey',
  quitDate: '21 Haziran 2022',
  dailyCigaretteCount: 20,
  cigarettePrice: 30,
  currency: 'TRY',
  cigaretteAmountInPack: 20,
  smokingYears: 25,
  termsAndPolicyOk: false,
  challengeDurationInhours: 240,
  saveUpForSmth: 300,
  prefereces: Prefereces(
    language: 'tr',
    notifications: true,
    sounds: true,
    vibration: true,
    theme: 'Dark',
  ),
  reasons: [
    'resons 1',
    'reasons 2',
  ],
  saveUp: [
    SaveUp(
      title: 'snacks',
      price: 200,
      link: 'df',
      note: 'sdf',
      purchased: false,
    )
  ],
  dailyMood: [
    DailyMood(
      date: '',
      cravings: 2,
      p1: 5,
      p1c: 'df',
      p2: 2,
      p2c: '',
      p3: 3,
      p3c: '',
      p4: 4,
      p4c: '',
    )
  ],
);
