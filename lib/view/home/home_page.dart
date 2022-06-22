import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Quit Smoking"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.face))
          ],
        ),
        body: ListView(
          children: [const StopWatchSection()],
        ));
  }
}

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
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.blueGrey[100]),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Icon(Icons.timer_outlined, size: 80),
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
                    Text("${duration.inHours}",
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
