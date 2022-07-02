import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/util/show_overlay.dart';
import '../../model/user_view_model.dart';
import 'add_motivation_form.dart';

class MotivationPage extends StatelessWidget {
  const MotivationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Motivation'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final user = ref.watch(userProvider);
          return ReorderableListView.builder(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
            physics: const BouncingScrollPhysics(),
            itemCount: user.reasons!.length,
            proxyDecorator:
                (Widget child, int index, Animation<double> animation) {
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
              List<String> reasonList = user.reasons!.toList();
              final String item = reasonList.removeAt(oldIndex);
              reasonList.insert(newIndex, item);
              ref
                  .read(userProvider.notifier)
                  .updateUser(user.copyWith(reasons: reasonList));
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Show.bottomSheet(
            context,
            const BottomSheetForm(),
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
