import 'package:flutter/material.dart';
import 'package:quit_smoking/view/health/health_page.dart';

import '../../core/constant.dart';

class HealthSection extends StatelessWidget {
  const HealthSection({
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
              .push(MaterialPageRoute(builder: (_) => const HealthPage()));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sağlık Gelişmeleri",
                      style: Theme.of(context).textTheme.headline6),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                            elapsed >= 1 ? Colors.green : Colors.blue),
                        value: elapsed,
                      ),
                      Text(
                          '${elapsed > 1 ? 100 : (elapsed * 100).toStringAsFixed(0)}')
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.task_outlined, size: 64),
                  Text(Constant.healthStatus[4]['title'])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
