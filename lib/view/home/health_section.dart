import 'package:flutter/material.dart';

import '../../core/constant.dart';
import '../health/health_page.dart';
import 'home_page.dart';

class HealthSection extends StatelessWidget {
  const HealthSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const HealthPage()));
      },
      child: SizedBox(
        height: 176,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: List.generate(
            Constant.healthStatus.length,
            (i) {
              double elapsed = duration.inSeconds /
                  Constant.healthStatus[i]['duration'].inSeconds;
              int index = Constant.healthStatus
                  .indexWhere((el) => el['duration'] > duration);
              return elapsed < 1 || i == index - 1
                  ? Container(
                      width: 156,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: LinearProgressIndicator(
                                    minHeight: 12,
                                    backgroundColor: Colors.pinkAccent[100],
                                    valueColor: AlwaysStoppedAnimation(
                                        elapsed >= 1
                                            ? Colors.green
                                            : Colors.blue),
                                    value: elapsed,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    '${elapsed > 1 ? 100 : (elapsed * 100).toStringAsFixed(0)}%'),
                              )
                            ],
                          ),
                          const SizedBox(width: 12),
                          Text(Constant.healthStatus[i]['title']),
                        ],
                      ),
                    )
                  : const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
