import 'package:flutter/material.dart';

import '../../core/constant.dart';
import 'home_page.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2), borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisExtent: 148),
              children: [
                Column(
                  children: [
                    const Icon(
                      Icons.calendar_month_rounded,
                      size: 36,
                      color: Colors.green,
                    ),
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
                    const Icon(
                      Icons.smoke_free,
                      size: 36,
                      color: Colors.green,
                    ),
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
                    const Icon(
                      Icons.monetization_on_outlined,
                      size: 36,
                      color: Colors.green,
                    ),
                    Text(
                        "₺${(duration.inHours * (25 / 24)).toStringAsFixed(0)}",
                        style: Theme.of(context).textTheme.headline4),
                    const Text(
                      'kurtarılan\npara',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      size: 36,
                      color: Colors.green,
                    ),
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
                    const Icon(
                      Icons.healing_rounded,
                      size: 36,
                      color: Colors.blue,
                    ),
                    Text(
                        "${Constant.healthStatus.indexWhere((el) => el['duration'] > duration)}/${Constant.healthStatus.length}",
                        style: Theme.of(context).textTheme.headline4),
                    const Text(
                      'health\nimprov...',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.smoke_free,
                      size: 36,
                      color: Colors.blue,
                    ),
                    Text("20", style: Theme.of(context).textTheme.headline4),
                    const Text(
                      'cravings\nresisted',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.monetization_on_outlined,
                      size: 36,
                      color: Colors.blue,
                    ),
                    Text("₺20", style: Theme.of(context).textTheme.headline4),
                    const Text(
                      'save up\nfor smth.',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                // sigare adedi * 5 dk
                Column(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      size: 36,
                      color: Colors.blue,
                    ),
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
      ),
    );
  }
}
