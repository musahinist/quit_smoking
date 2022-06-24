import 'package:flutter/material.dart';
import 'package:quit_smoking/view/achievement/achievement_page.dart';
import 'package:quit_smoking/view/health/health_page.dart';

import '../../core/constant.dart';

class AchievementSection extends StatelessWidget {
  const AchievementSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration duration =
        DateTime.now().difference(DateTime(2022, 6, 21, 18, 00));
    double elapsed =
        duration.inSeconds / Constant.healthStatus[4]['duration'].inSeconds;

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const AchievementPage()));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Achievements",
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    Constant.achievements.length,
                    (i) {
                      double elapsed = duration.inSeconds /
                          Constant.achievements[i]['duration'].inSeconds;
                      return elapsed < 1
                          ? Container(
                              width: 180,
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
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
                                                    const AlwaysStoppedAnimation(
                                                        Colors.blue),
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
                                  const Icon(Icons.health_and_safety_rounded,
                                      size: 100),
                                  Text(Constant.achievements[i]['body']),
                                ],
                              ),
                            )
                          : SizedBox();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
