import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../home/title_widget.dart';

import '../../core/constant.dart';
import '../../model/stopwatch.dart';
import '../../model/user_view_model.dart';
import '../home/progress_section.dart';

class ProgressPage extends ConsumerWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(userProvider);
    final duration = ref.watch(timerProviderMin);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Overall Progress'),
      ),
      body: ListView(padding: const EdgeInsets.all(12), children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisExtent: 128),
                  children: [
                    ProgressTile(
                      icon: Icons.calendar_month_rounded,
                      value: "${duration.inDays}",
                      definition: 'sigarasız\ngün',
                    ),
                    ProgressTile(
                      icon: Icons.smoke_free,
                      value: (duration.inHours * (20 / 24)).toStringAsFixed(0),
                      definition: 'içilmeyen\nsigara',
                    ),
                    ProgressTile(
                      icon: Icons.monetization_on_outlined,
                      value:
                          "₺${(duration.inHours * (30 / 24)).toStringAsFixed(0)}",
                      definition: 'kurtarılan\npara',
                    ),
                    ProgressTile(
                      icon: Icons.healing_rounded,
                      value:
                          "${Constant.healthStatus.indexWhere((el) => el['duration'] > duration)}/${Constant.healthStatus.length}",
                      definition: 'health\nrecovery',
                    ),
                    ProgressTile(
                      icon: Icons.watch_later_outlined,
                      value: "${(duration.inHours / 12).toStringAsFixed(0)}s",
                      definition: 'geri\nkazanıldı',
                    ),

                    ProgressTile(
                      icon: Icons.timelapse_outlined,
                      value: "${(duration.inDays * 1.66).toStringAsFixed(0)}s",
                      definition: 'not spent\nsmoking',
                    ),
                    // Column(
                    //   children: [
                    //     const Icon(
                    //       Icons.smoke_free,
                    //       size: 36,
                    //       color: Colors.blue,
                    //     ),
                    //     Text("2", style: Theme.of(context).textTheme.headline5),
                    //     const Text('cravings\nresisted',
                    //         textAlign: TextAlign.center)
                    //   ],
                    // ),
                    // Column(
                    //   children: [
                    //     const Icon(
                    //       Icons.monetization_on_outlined,
                    //       size: 36,
                    //       color: Colors.blue,
                    //     ),
                    //     Text(
                    //         "₺${(duration.inHours * (30 / 24)).toStringAsFixed(0)}",
                    //         style: Theme.of(context).textTheme.headline5),
                    //     const Text('save up\nfor smth.',
                    //         textAlign: TextAlign.center)
                    //   ],
                    // ),
                    // sigare adedi * 5 dk
                  ],
                ),
              ],
            ),
          ),
        ),
        const TitleWidget(
            title: 'Cigarettes avoided', icon: Icons.table_chart_outlined),
        const TimePeriodTable(amountPerDay: 20, unit: ''),
        const TitleWidget(
            title: 'Money Saved', icon: Icons.table_chart_outlined),
        const TimePeriodTable(amountPerDay: 30, unit: '₺ '),
        const TitleWidget(
            title: 'Lifetime won back', icon: Icons.table_chart_outlined),
        const TimePeriodTable(amountPerDay: 2, unit: ' hours', prefix: false),
        const TitleWidget(
            title: 'Time not wasted for smoking',
            icon: Icons.table_chart_outlined),
        const TimePeriodTable(amountPerDay: 1, unit: ' hours', prefix: false),
      ]),
    );
  }
}

class TimePeriodTable extends StatelessWidget {
  const TimePeriodTable({
    Key? key,
    required this.amountPerDay,
    required this.unit,
    this.prefix = true,
  }) : super(key: key);
  final String unit;
  final bool prefix;
  final int amountPerDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2), borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          ListTile(
            title: const Text('Per day'),
            trailing:
                TextUnit(unit: unit, amount: amountPerDay * 1, prefix: prefix),
          ),
          ListTile(
            title: const Text('Per week'),
            trailing:
                TextUnit(unit: unit, amount: amountPerDay * 7, prefix: prefix),
          ),
          ListTile(
            title: const Text('Per month'),
            trailing:
                TextUnit(unit: unit, amount: amountPerDay * 30, prefix: prefix),
          ),
          ListTile(
            title: const Text('Per year'),
            trailing: TextUnit(
                unit: unit, amount: amountPerDay * 365, prefix: prefix),
          ),
          ListTile(
            title: const Text('Per decate'),
            trailing: TextUnit(
                unit: unit, amount: amountPerDay * 365 * 10, prefix: prefix),
          )
        ],
      ),
    );
  }
}

class TextUnit extends StatelessWidget {
  const TextUnit({
    Key? key,
    required this.unit,
    required this.amount,
    this.prefix = true,
  }) : super(key: key);

  final String unit;
  final int amount;
  final bool prefix;
  @override
  Widget build(BuildContext context) {
    return Text(prefix ? '$unit$amount' : '$amount$unit');
  }
}
