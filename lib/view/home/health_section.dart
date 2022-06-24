import 'package:flutter/material.dart';
import 'package:quit_smoking/view/achievement/achievement_page.dart';
import 'package:quit_smoking/view/health/health_page.dart';

import '../../core/constant.dart';
import 'home_page.dart';

class HealthSection extends StatelessWidget {
  const HealthSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const HealthPage()));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Health Improvements",
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    Constant.healthStatus.length,
                    (i) {
                      double elapsed = duration.inSeconds /
                          Constant.healthStatus[i]['duration'].inSeconds;
                      int index = Constant.healthStatus
                          .indexWhere((el) => el['duration'] > duration);
                      return elapsed < 1 || i == index - 1
                          ? Container(
                              width: 250,
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            elapsed < 1
                                                ? Colors.blue
                                                : Colors.green),
                                        value: elapsed,
                                      ),
                                      Text(
                                          '${elapsed > 1 ? 100 : (elapsed * 100).toStringAsFixed(0)}')
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                      child: Text(
                                          Constant.healthStatus[i]['title'])),
                                ],
                              ),
                            )
                          : const SizedBox();
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
