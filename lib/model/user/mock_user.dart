import 'daily_mood.dart';
import 'prefereces.dart';
import 'save_up.dart';

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
    'Daha sağlıklı olmak için',
    'Bağımlılıklarından kurtulmak insanı daha güçlü yapar.',
    'Günde 100 dk sigara içmek için israf oluyor. Kendime daha fazla zaman ayırmak için.',
    'Sigara uyku kalitesini düşürüyor. Daha kaliteli bir uyku uyumak için.',
    'Aylık 900 TL sigara masrafı var. Biriktirdiğim parayı faklı ihtiyaçlarıma harcamak için',
    'Kendinizi sigara içmeyen biri olarak hayal edin',
    'Sigara içmek istediğinizde sebeplerinize göz atın.',
    'Siagara eçmeyerek tasarruf ettiğiniz parayı düşünün. Bu parayı sizin için özel olan şeyler için harcamak adına plan yapın.'
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
