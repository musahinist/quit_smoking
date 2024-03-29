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
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   mainAxisSpacing: 12,
        //   crossAxisSpacing: 12,
        //   crossAxisCount: 2,
        // ),
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            maxCrossAxisExtent: 160,
            mainAxisExtent: 200),
        children: List.generate(
          Constant.achievements.length,
          (i) {
            double elapsed = duration.inSeconds /
                Constant.achievements[i]['duration'].inSeconds;
            return Container(
              decoration: BoxDecoration(
                //color: Colors.white,
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
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
                                  backgroundColor: Colors.grey[200],
                                  valueColor: const AlwaysStoppedAnimation(
                                      Colors.lightBlue),
                                  value: elapsed,
                                ),
                                Text(
                                    '${elapsed > 1 ? 100 : (elapsed * 100).toStringAsFixed(0)}')
                              ],
                            )
                          : const Icon(
                              Icons.check_circle,
                              size: 44,
                              color: Colors.lightGreen,
                            ),
                    ),
                    const Icon(
                      Icons.health_and_safety_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
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
