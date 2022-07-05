import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/stopwatch.dart';

class StopWatchTimer extends ConsumerWidget {
  const StopWatchTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(timerProviderSec);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text("${duration.inDays}",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold)),
            const Text('days')
          ],
        ),
        Column(
          children: [
            Text("${duration.inHours.remainder(24)}",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold)),
            const Text('hours')
          ],
        ),
        Column(
          children: [
            Text("${duration.inMinutes.remainder(60)}",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.lightBlue)),
            const Text('minutes')
          ],
        ),
        Column(
          children: [
            Text("${(duration.inSeconds.remainder(60))}",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.lightBlue)),
            const Text('seconds')
          ],
        ),
      ],
    );
  }
}
