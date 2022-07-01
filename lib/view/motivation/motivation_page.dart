import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_smoking/core/widget/util/show_overlay.dart';

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
        itemCount: user.reasons!.length,
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final String item = user.reasons!.removeAt(oldIndex);
          user.reasons!.insert(newIndex, item);
        },
        itemBuilder: (_, i) {
          return ListTile(key: Key('$i'), title: Text(user.reasons![i]));
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
                    maxLines: 5,
                    autofocus: true,
                    decoration: const InputDecoration(
                        hintText: 'Comments',
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 5.0),
                        )),
                  ),
                  const SizedBox(height: 16),
                ],
              ));
        },
        backgroundColor: Colors.white,
        shape: const CircleBorder(
            side: BorderSide(color: Colors.lightBlue, width: 4)),
        child:
            const Icon(Icons.add_moderator_outlined, color: Colors.lightBlue),
      ),
    );
  }
}
