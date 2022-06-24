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

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const AchievementPage()));
      },
      child: SizedBox(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: List.generate(
            Constant.achievements.length,
            (i) {
              double elapsed = duration.inSeconds /
                  Constant.achievements[i]['duration'].inSeconds;
              int index = Constant.achievements
                  .indexWhere((el) => el['duration'] > duration);
              return elapsed < 1 || i == index - 1
                  ? Container(
                      width: 148,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        //  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: Stack(
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
                              )),
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
      ),
    );
  }
}
