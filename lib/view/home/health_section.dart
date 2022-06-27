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
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const HealthPage()));
      },
      child: SizedBox(
        height: 180,
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
                      width: 150,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      elapsed < 1 ? Colors.blue : Colors.green),
                                  value: elapsed,
                                ),
                                Text(
                                    '${elapsed > 1 ? 100 : (elapsed * 100).toStringAsFixed(0)}')
                              ],
                            ),
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
