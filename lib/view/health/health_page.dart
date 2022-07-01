import 'package:flutter/material.dart';

import '../../core/constant.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration duration =
        DateTime.now().difference(DateTime(2022, 6, 21, 18, 00));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Sağlık'),
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: List.generate(
          Constant.healthStatus.length,
          (i) {
            double elapsed = duration.inSeconds /
                Constant.healthStatus[i]['duration'].inSeconds;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: LinearProgressIndicator(
                          minHeight: 12,
                          backgroundColor: Colors.lightBlue[100],
                          valueColor: AlwaysStoppedAnimation(
                              elapsed >= 1 ? Colors.green : Colors.blue),
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
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                SizedBox(height: 24)
              ],
            );
          },
        ),
      ),
    );
  }
}
