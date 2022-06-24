import 'package:flutter/material.dart';

import '../../core/constant.dart';
import 'home_page.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Toplam İlerleme", style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 16),
          GridView(
            shrinkWrap: true,
            padding: EdgeInsets.all(6),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 24),
            children: [
              Column(
                children: [
                  const Icon(Icons.calendar_month_rounded, size: 48),
                  Text("${duration.inDays}g",
                      style: Theme.of(context).textTheme.headline4),
                  const Text(
                    'sigrasız\ngün sayısı',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.smoke_free, size: 48),
                  Text("${(duration.inHours * (20 / 24)).toStringAsFixed(0)}",
                      style: Theme.of(context).textTheme.headline4),
                  const Text(
                    'içilmeyen\nsigara',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.monetization_on_outlined, size: 48),
                  Text("₺${(duration.inHours * (25 / 24)).toStringAsFixed(0)}",
                      style: Theme.of(context).textTheme.headline4),
                  const Text(
                    'kurtarılan\npara',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.watch_later_outlined, size: 48),
                  Text("${(duration.inHours / 12).toStringAsFixed(0)}s",
                      style: Theme.of(context).textTheme.headline4),
                  const Text(
                    'geri\nkazanıldı',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.healing_rounded, size: 48),
                  Text(
                      "${Constant.healthStatus.indexWhere((el) => el['duration'] > duration)}/${Constant.healthStatus.length}",
                      style: Theme.of(context).textTheme.headline4),
                  const Text(
                    'health\nimprovement',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.smoke_free, size: 48),
                  Text("20", style: Theme.of(context).textTheme.headline4),
                  const Text(
                    'cravings\nresisted',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.monetization_on_outlined, size: 48),
                  Text("₺20", style: Theme.of(context).textTheme.headline4),
                  const Text(
                    'save up\nfor something',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              // sigare adedi * 5 dk
              Column(
                children: [
                  const Icon(Icons.watch_later_outlined, size: 48),
                  Text("${(duration.inDays * 1.66).toStringAsFixed(0)}s",
                      style: Theme.of(context).textTheme.headline4),
                  const Text(
                    'not spent\nsmoking',
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
