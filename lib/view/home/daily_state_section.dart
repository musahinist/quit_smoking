import 'package:flutter/material.dart';
import 'package:quit_smoking/core/widget/util/show_overlay.dart';
import 'package:quit_smoking/view/health/health_page.dart';

class DailyStateSection extends StatefulWidget {
  const DailyStateSection({
    Key? key,
  }) : super(key: key);

  @override
  State<DailyStateSection> createState() => _DailyStateSectionState();
}

class _DailyStateSectionState extends State<DailyStateSection> {
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreen,
    Colors.blue
  ];
  List<Map<String, dynamic>> dailyStatus = [
    {'interval': "08:00\n12:00", "color": Colors.white},
    {'interval': "12:00\n16:00", "color": Colors.white},
    {'interval': "16:00\n20:00", "color": Colors.white},
    {'interval': "20:00\n24:00", "color": Colors.white}
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(width: 2), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(dailyStatus.length, (i) {
          return Expanded(
            child: InkWell(
              onTap: () async {
                Show.bottomSheet(
                    context,
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(colors.length, (j) {
                          return Expanded(
                            child: InkWell(
                              onTap: () {
                                dailyStatus[i]['color'] = colors[j];
                                setState(() {});
                              },
                              child: Container(
                                height: 56,
                                color: colors[j],
                              ),
                            ),
                          );
                        }),
                      ),
                    ));
              },
              child: Container(
                height: 56,
                color: dailyStatus[i]['color'],
                alignment: Alignment.center,
                child: Text(dailyStatus[i]['interval']),
              ),
            ),
          );
        }),
      ),
    );
  }
}
