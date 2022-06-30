import 'dart:async';

import 'package:riverpod/riverpod.dart';

final timerProviderSec = StateNotifierProvider<StopWatch, Duration>((ref) {
  return StopWatch(const Duration(seconds: 1));
});
final timerProviderMin = StateNotifierProvider<StopWatch, Duration>((ref) {
  return StopWatch(const Duration(minutes: 1));
});

class StopWatch extends StateNotifier<Duration> {
  static final DateTime quitTime = DateTime(2022, 6, 21, 18, 00);
  // 1. initialize with current time
  StopWatch(Duration period) : super(DateTime.now().difference(quitTime)) {
    // 2. create a timer that fires every second
    _timer = Timer.periodic(period, (_) {
      // 3. update the state with the current time
      state = DateTime.now().difference(quitTime);
    });
  }

  late final Timer _timer;

  // 4. cancel the timer when finished
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
