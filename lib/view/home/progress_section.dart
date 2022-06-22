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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.calendar_month_rounded, size: 48),
                    Text("1", style: Theme.of(context).textTheme.titleLarge),
                    const Text(
                      'sigrasız\ngün sayısı',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.smoke_free, size: 48),
                    Text("20", style: Theme.of(context).textTheme.titleLarge),
                    const Text(
                      'içilmeyen\nsigara',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.monetization_on_outlined, size: 48),
                    Text("26.0 TRY",
                        style: Theme.of(context).textTheme.titleLarge),
                    const Text(
                      'kurtarılan\npara',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.watch_later_outlined, size: 48),
                    Text("2s", style: Theme.of(context).textTheme.titleLarge),
                    const Text(
                      'geri\nkazanıldı',
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
