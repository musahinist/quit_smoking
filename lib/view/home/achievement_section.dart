import 'package:flutter/material.dart';

import '../../core/constant.dart';
import '../achievement/achievement_page.dart';

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
        height: 176,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            Constant.achievements.length,
            (i) {
              double elapsed = duration.inSeconds /
                  Constant.achievements[i]['duration'].inSeconds;
              int index = Constant.achievements
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    backgroundColor: Colors.grey[200],
                                    valueColor: AlwaysStoppedAnimation(
                                        elapsed > 1
                                            ? Colors.lightGreen
                                            : Colors.lightBlue),
                                    value: elapsed,
                                  ),
                                  Text((elapsed.clamp(0, 1) * 100)
                                      .toStringAsFixed(0))
                                ],
                              )),
                          const Icon(
                            Icons.health_and_safety_outlined,
                            size: 80,
                            color: Colors.grey,
                          ),
                          Text(Constant.achievements[i]['body']),
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
