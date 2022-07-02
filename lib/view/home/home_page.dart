import 'package:flutter/material.dart';

import '../more/more_page.dart';
import '../profile/profile.page.dart';
import 'achievement_section.dart';
import 'arc_chart_section.dart';
import 'daily_mood_section.dart';
import 'gift_section.dart';
import 'health_section.dart';
import 'motivation_section.dart';
import 'progress_section.dart';
import 'title_widget.dart';

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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const MorePage()));
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
        children: const [
          ArcChartSection(),
          //
          TitleWidget(title: "Daily Mood"),
          DailyMoodSection(),
          //
          TitleWidget(title: "Progress"),
          ProgressSection(),
          //
          TitleWidget(title: "Motivation"),
          MotivationSection(),
          //
          TitleWidget(title: "Health Improvements"),
          HealthSection(),
          //
          TitleWidget(title: "Achievements"),
          AchievementSection(),
          //
          TitleWidget(title: "Pamper Yourself"),
          GiftSection(),
        ],
      ),
    );
  }
}
