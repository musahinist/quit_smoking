import 'package:flutter/material.dart';
import 'package:quit_smoking/view/health/health_page.dart';

import '../../core/constant.dart';

class DailyStateSection extends StatelessWidget {
  const DailyStateSection({
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Günlük Durum",
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
                      color: Colors.yellow,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
                      color: Colors.orange,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
