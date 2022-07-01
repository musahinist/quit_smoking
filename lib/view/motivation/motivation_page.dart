import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/widget/util/show_overlay.dart';

import '../../model/user_view_model.dart';

class MotivationPage extends ConsumerWidget {
  const MotivationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Motivation'),
      ),
      body: ReorderableListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        physics: const BouncingScrollPhysics(),
        itemCount: user.reasons!.length,
        proxyDecorator: (Widget child, int index, Animation<double> animation) {
          return Material(
            //  color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: child,
          );
        },
        // itemExtent: 100,
        buildDefaultDragHandles: false,
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final String item = user.reasons!.removeAt(oldIndex);
          user.reasons!.insert(newIndex, item);
        },
        itemBuilder: (_, i) {
          return Container(
            key: Key('$i'),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              //color: Colors.white,
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(child: Text(user.reasons![i])),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz_outlined)),
                    ReorderableDragStartListener(
                      index: i,
                      child: const Icon(Icons.drag_handle_rounded),
                    ),
                  ],
                )
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
              children: [
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: null,
                  autofocus: true,
                  maxLength: 144,
                  decoration: const InputDecoration(
                    hintText: 'Reason to quit smoking...',
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 5.0),
                    ),
                  ),
                ),
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
            const Icon(Icons.add_moderator_outlined, color: Colors.lightBlue),
      ),
    );
  }
}
