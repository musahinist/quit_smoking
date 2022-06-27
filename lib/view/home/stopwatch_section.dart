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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                '${duration.inDays + 1}. GÜN',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
            ]),
            SizedBox(
              width: 160,
              height: 160,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    painter: SemiCircleChart(
                        duration.inMinutes / (7 * 24 * 60), 80, Colors.blue),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${(duration.inMinutes * 100 / (7 * 24 * 60)).toStringAsFixed(1)}',
                        textScaleFactor: 3,
                      ),
                      const Text('%'),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('7 GÜN'),
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
    drawArc(canvas, paint, percent);
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
