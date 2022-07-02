import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/ui/form/date_form_field.dart';
import '../../model/user/user.dart';
import '../../model/user_view_model.dart';

class SmokerInfoSection extends ConsumerWidget {
  const SmokerInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Former Smoker Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DateFormField(
              label: 'When did you quit smoking?',
              onChanged: (value) {
                print(value.toIso8601String());
                ref.read(userProvider.notifier).updateUser(
                    user.copyWith(quitDate: value.toIso8601String()));
              }),
          // TextFormField(
          //   initialValue: "20",
          //   decoration: const InputDecoration(
          //     label: Text('Siagra içilen yıl'),
          //   ),
          // ),
          TextFormField(
            initialValue: "20",
            decoration: const InputDecoration(
              label: Text('How many cigarettes did you smoke per day?'),
            ),
          ),
          TextFormField(
            initialValue: "20",
            decoration: const InputDecoration(
              label: Text('How many cigarettes where in the pack?'),
            ),
          ),
          TextFormField(
            initialValue: "25",
            decoration: const InputDecoration(
              label: Text('What is the price of the pack?'),
            ),
          ),
          TextFormField(
            initialValue: "TRY",
            decoration: const InputDecoration(
              label: Text('Currency'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {},
      ),
    );
  }
}
