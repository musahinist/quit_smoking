import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constant.dart';
import '../../model/stopwatch.dart';
import '../../model/user_view_model.dart';
import '../progress/progress_page.dart';

class ProgressSection extends ConsumerWidget {
  const ProgressSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Duration selectedDuration = const Duration(days: 14);
    final duration = ref.watch(timerProviderMin);
    final user = ref.watch(userProvider);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const ProgressPage()));
      },
      child: Container(
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
    );
  }
}

class ProgressTile extends StatelessWidget {
  const ProgressTile(
      {Key? key,
      required this.value,
      required this.definition,
      required this.icon})
      : super(key: key);
  final IconData icon;
  final String value;
  final String definition;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 36, color: Colors.lightGreen),
        Text(
          value,
          style: const TextStyle(
            color: Colors.lightBlue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(definition, textAlign: TextAlign.center)
      ],
    );
  }
}
