import 'package:flutter/material.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Toplam İlerleme",
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Icon(Icons.calendar_month_rounded, size: 48),
                    Text("1g", style: Theme.of(context).textTheme.headline4),
                    const Text(
                      'sigrasız\ngün sayısı',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.smoke_free, size: 48),
                    Text("20", style: Theme.of(context).textTheme.headline4),
                    const Text(
                      'içilmeyen\nsigara',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.monetization_on_outlined, size: 48),
                    Text("₺26", style: Theme.of(context).textTheme.headline4),
                    const Text(
                      'kurtarılan\npara',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.watch_later_outlined, size: 48),
                    Text("2s", style: Theme.of(context).textTheme.headline4),
                    const Text(
                      'geri\nkazanıldı',
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Icon(Icons.calendar_month_rounded, size: 48),
                    Text("1g", style: Theme.of(context).textTheme.headline4),
                    const Text(
                      'sigrasız\ngün sayısı',
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
                    Text("2s", style: Theme.of(context).textTheme.headline4),
                    const Text(
                      'not spent\nsmoking',
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
