import 'dart:async';

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
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      duration = DateTime.now().difference(DateTime(2022, 6, 21, 18, 00));
      String sDuration =
          "${duration.inHours}:${duration.inMinutes.remainder(60)}:${(duration.inSeconds.remainder(60))}";
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Icon(Icons.timer_outlined, size: 120),
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
            )
          ],
        ),
      ),
    );
  }
}
