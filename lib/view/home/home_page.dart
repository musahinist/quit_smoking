import 'package:flutter/material.dart';
import 'package:quit_smoking/core/constant.dart';
import 'package:quit_smoking/view/home/achievement_section.dart';
import 'package:quit_smoking/view/home/progress_section.dart';
import 'package:quit_smoking/view/home/stopwatch_section.dart';

import '../profile/profile.page.dart';
import 'daily_mood_section.dart';
import 'gift_section.dart';
import 'health_section.dart';

Duration duration = DateTime.now().difference(DateTime(2022, 6, 21, 18, 00));

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Quit Smoking"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ProfilePage()));
              },
              icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ProfilePage()));
              },
              icon: const Icon(Icons.more_outlined)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ProfilePage()));
              },
              icon: const Icon(Icons.face))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        physics: const BouncingScrollPhysics(),
        children: [
          const StopWatchSection(),
          //
          const SizedBox(height: 24),
          Text("Daily Mood", style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 12),
          const DailyMoodSection(),
          //
          const SizedBox(height: 24),
          Text("Toplam İlerleme", style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 12),
          const ProgressSection(),

          //
          const SizedBox(height: 24),
          Text("Health Improvements",
              style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 12),
          const HealthSection(),
          const SizedBox(height: 24),
          Text("Achievements", style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 12),
          const AchievementSection(),
          const SizedBox(height: 24),
          Text("Pamper Yourself", style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 12),
          const GiftSection(),
        ],
      ),
    );
  }
}
