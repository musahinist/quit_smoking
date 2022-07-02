import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/stopwatch.dart';
import '../../model/user/save_up.dart';
import '../../model/user/user.dart';
import '../../model/user_view_model.dart';
import '../gift/gift_page.dart';

class GiftSection extends ConsumerWidget {
  const GiftSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User user = ref.watch(userProvider);
    final duration = ref.watch(timerProviderMin);
    //to convert unmodifiable to modifiable
    List<SaveUp> saveUp = user.saveUp!.toList();
    saveUp.sort((a, b) => a.price!.compareTo(b.price!));
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const GiftPage()));
      },
      child: SizedBox(
        height: 140,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            saveUp.length,
            (i) {
              double priceRatio =
                  duration.inHours * (30 / 24) / saveUp[i].price!;

              return Container(
                width: 156,
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: CircularProgressIndicator(
                            strokeWidth: 8,
                            backgroundColor: Colors.blueGrey.shade50,
                            valueColor: AlwaysStoppedAnimation(priceRatio > 1
                                ? Colors.lightGreen
                                : Colors.lightBlue),
                            value: priceRatio,
                          ),
                        ),
                        Text(
                            '${priceRatio > 1 ? 100 : (priceRatio * 100).toStringAsFixed(0)}')
                      ],
                    ),
                    Text(
                      '₺${saveUp[i].price!}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(saveUp[i].title!),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
