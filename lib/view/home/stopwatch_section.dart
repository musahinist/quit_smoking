import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class StopWatchSection extends StatefulWidget {
  const StopWatchSection({
    Key? key,
  }) : super(key: key);

  @override
  State<StopWatchSection> createState() => _StopWatchSectionState();
}

class _StopWatchSectionState extends State<StopWatchSection> {
  late Timer timer;
  Duration duration = DateTime.now().difference(DateTime(2022, 6, 21, 18, 00));
  Duration selectedDuration = const Duration(days: 10);
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (time) {
      duration = DateTime.now().difference(DateTime(2022, 6, 21, 18, 00));
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2), borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${duration.inDays + 1}. GÜN',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                PopupMenuButton<Duration>(
                  icon: const Icon(Icons.more_horiz),

                  // Callback that sets the selected popup menu item.
                  onSelected: (Duration duration) {
                    setState(() {
                      selectedDuration = duration;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<Duration>>[
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 1),
                      child: Text('1 Gün'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 2),
                      child: Text('2 Gün'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 3),
                      child: Text('3 Gün'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 5),
                      child: Text('5 Gün'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 7),
                      child: Text('7 Gün'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 10),
                      child: Text('10 Gün'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 14),
                      child: Text('2 Hafta'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 21),
                      child: Text('3 Hafta'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 30),
                      child: Text('1 Ay'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 60),
                      child: Text('2 Ay'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 100),
                      child: Text('100 Gün'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 120),
                      child: Text('4 Ay'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 180),
                      child: Text('6 Ay'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 270),
                      child: Text('9 Ay'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 365),
                      child: Text('1 Yıl'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 730),
                      child: Text('2 Yıl'),
                    ),
                    const PopupMenuItem<Duration>(
                      value: Duration(days: 1825),
                      child: Text('5 Yıl'),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 160,
              height: 160,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    painter: SemiCircleChart(
                        duration.inMinutes /
                            (selectedDuration.inDays * 24 * 60),
                        80,
                        Colors.blue),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${(duration.inMinutes * 100 / (selectedDuration.inDays * 24 * 60)).clamp(0, 100).toStringAsFixed(1)}',
                        textScaleFactor: 3,
                      ),
                      const Text('%'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('${selectedDuration.inDays} GÜN'),
                    ),
                  )
                  // const Icon(Icons.timer_outlined,
                  //     size: 150, color: Colors.green),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("${duration.inDays}",
                        style: Theme.of(context).textTheme.headline3),
                    const Text('days')
                  ],
                ),
                const SizedBox(width: 36),
                Column(
                  children: [
                    Text("${duration.inHours.remainder(24)}",
                        style: Theme.of(context).textTheme.headline3),
                    const Text('hours')
                  ],
                ),
                const SizedBox(width: 36),
                Column(
                  children: [
                    Text("${duration.inMinutes.remainder(60)}",
                        style: Theme.of(context).textTheme.headline3),
                    const Text('minutes')
                  ],
                ),
                const SizedBox(width: 36),
                Column(
                  children: [
                    Text("${(duration.inSeconds.remainder(60))}",
                        style: Theme.of(context).textTheme.headline3),
                    const Text('seconds')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SemiCircleChart extends CustomPainter {
  final double radius;
  final Color color;
  final double percent;
  SemiCircleChart(this.percent, this.radius, this.color);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 24
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    drawArc(canvas, paint, 1);
    paint.color = Colors.white;
    paint.strokeWidth = 20;
    drawArc(canvas, paint, 1);
    paint.color = color;
    drawArc(canvas, paint, percent.clamp(0, 1));
  }

  drawArc(Canvas canvas, Paint paint, double perc) {
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset.zero,
          width: radius * 2,
          height: radius * 2,
        ),
        0.8 * math.pi,
        (perc * 1.4 * math.pi),
        false,
        paint);
  }

  @override
  bool shouldRepaint(SemiCircleChart oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SemiCircleChart oldDelegate) => false;
}
