import 'package:flutter/material.dart';
import 'package:quit_smoking/view/home/progress_section.dart';
import 'package:quit_smoking/view/home/stopwatch_section.dart';

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.face))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: const [
          StopWatchSection(),
          ProgressSection(),
          HealthSection()
        ],
      ),
    );
  }
}

class HealthSection extends StatelessWidget {
  const HealthSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            minHeight: 8,
            valueColor: AlwaysStoppedAnimation(Colors.green),
            value: .9,
          ),
        )
      ],
    );
  }
}
