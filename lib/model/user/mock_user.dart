import 'package:quit_smoking/model/user/daily_mood.dart';
import 'package:quit_smoking/model/user/prefereces.dart';
import 'package:quit_smoking/model/user/save_up.dart';

import 'user.dart';

User mockUser = const User(
  name: 'mshn',
  email: 'sahinmusa@gmail.com',
  profilePhoto: '',
  bio: 'about me my bio',
  location: 'Turkey',
  quitDate: '2022-06-21T18:00:00.000',
  dailyCigaretteCount: 20,
  cigarettePrice: 30,
  currency: 'TRY',
  cigaretteAmountInPack: 20,
  smokingYears: 25,
  termsAndPolicyOk: false,
  challengeDurationInhours: 24 * 14,
  saveUpForSmth: 300,
  prefereces: Prefereces(
    language: 'tr',
    notifications: true,
    sounds: true,
    vibration: true,
    theme: 'Dark',
  ),
  reasons: [
    'egdfg dfgdf dfg dfgdfg dfg ddfgd dffdfg dfgdg dfgfg fgdfgdfg dfg dfgdfgfdgdg dfgdfgfg fgfg f gfgf fgedfgdfgdfg dfgfggg fgfgf fgfggg dfgfg gfgfgf',
    'egdfg dfgdf dfg dfgdfg dfg ddfgd dffdfg dfgdg dfgfg fgdfgdfg dfg dfgdfgfdgdg dfgdfgfg fgfg f gfgf fgedfgdfgdfg dfgfggg fgfgf fgfggg dfgfg gfgfgf',
    'egdfg dfgdf dfg dfgdfg dfg ddfgd dffdfg dfgdg dfgfg fgdfgdfg dfg dfgdfgfdgdg dfgdfgfg fgfg f gfgf fgedfgdfgdfg dfgfggg fgfgf fgfggg dfgfg gfgfgf'
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
