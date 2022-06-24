import 'package:flutter/material.dart';

import '../../core/constant.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration duration =
        DateTime.now().difference(DateTime(2022, 6, 21, 18, 00));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Achievements'),
      ),
      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: const EdgeInsets.all(12),
        children: List.generate(
          Constant.achievements.length,
          (i) {
            double elapsed = duration.inSeconds /
                Constant.achievements[i]['duration'].inSeconds;
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: elapsed < 1
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularProgressIndicator(
                                  valueColor:
                                      const AlwaysStoppedAnimation(Colors.blue),
                                  value: elapsed,
                                ),
                                Text(
                                    '${elapsed > 1 ? 100 : (elapsed * 100).toStringAsFixed(0)}')
                              ],
                            )
                          : const Icon(
                              Icons.check_circle,
                              size: 48,
                              color: Colors.green,
                            ),
                    ),
                    const Icon(Icons.health_and_safety_rounded, size: 100),
                    Text(Constant.achievements[i]['body']),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
