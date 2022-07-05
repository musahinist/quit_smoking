import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constant.dart';
import '../../model/stopwatch.dart';
import '../../model/user_view_model.dart';

class HealthPage extends ConsumerWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(userProvider);
    final duration = ref.watch(timerProviderMin);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Sağlık'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: List.generate(
          Constant.healthStatus.length,
          (i) {
            double elapsed = duration.inSeconds /
                Constant.healthStatus[i]['duration'].inSeconds;
            return Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: LinearProgressIndicator(
                            minHeight: 12,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation(elapsed >= 1
                                ? Colors.lightGreen
                                : Colors.lightBlue),
                            value: elapsed,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '${elapsed > 1 ? 100 : (elapsed * 100).toStringAsFixed(0)}%'),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text(Constant.healthStatus[i]['title'])),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
