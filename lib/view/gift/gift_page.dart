import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_smoking/model/user/save_up.dart';
import '../../core/widget/util/show_overlay.dart';

import '../../model/stopwatch.dart';
import '../../model/user_view_model.dart';

class GiftPage extends ConsumerWidget {
  const GiftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final duration = ref.watch(timerProviderMin);
    List<SaveUp> saveUp = user.saveUp!.toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('My Gifts'),
      ),
      body: GridView.builder(
        itemCount: user.saveUp!.length,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
        physics: const BouncingScrollPhysics(),
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
        //   crossAxisSpacing: 12,
        //   mainAxisSpacing: 12,
        // ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            maxCrossAxisExtent: 160,
            mainAxisExtent: 180),
        // itemExtent: 100,

        itemBuilder: (_, i) {
          double priceRatio = duration.inHours * (30 / 24) / saveUp[i].price!;
          return Container(
            key: Key('$i'),
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            decoration: BoxDecoration(
              //color: Colors.white,
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz_outlined)),
                  ],
                ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Show.bottomSheet(
            context,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Gift Name',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 5.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 5.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    labelText: 'Gift Link',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 5.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: null,
                  maxLength: 144,
                  decoration: const InputDecoration(
                    labelText: 'Note',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 5.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () {}, child: const Text('Save')),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
        backgroundColor: Colors.white,
        shape: const CircleBorder(
          side: BorderSide(color: Colors.lightBlue, width: 4),
        ),
        child:
            const Icon(Icons.card_giftcard_outlined, color: Colors.lightBlue),
      ),
    );
  }
}
