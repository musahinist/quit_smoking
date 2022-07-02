import 'package:flutter/material.dart';

import '../../core/widget/ui/form/date_form_field.dart';
import '../../model/user/mock_user.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Sigarayı bırakma kararınız için tebrikler!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          DateFormField(
              label: 'Sigrayı bırakma tarihi',
              onChanged: (value) {
                mockUser = mockUser.copyWith(quitDate: value.toIso8601String());
              }),
          TextFormField(
            initialValue: "20",
            decoration: const InputDecoration(
              label: Text('Siagra içilen yıl'),
            ),
          ),
          TextFormField(
            initialValue: "20",
            decoration: const InputDecoration(
              label: Text('Günlük içilen sigara'),
            ),
          ),
          TextFormField(
            initialValue: "20",
            decoration: const InputDecoration(
              label: Text('1 pakette kaç sigara var'),
            ),
          ),
          TextFormField(
            initialValue: "25",
            decoration: const InputDecoration(
              label: Text('Günlük içilen sigara fiyatı'),
            ),
          ),
          TextFormField(
            initialValue: "TRY",
            decoration: const InputDecoration(
              label: Text('Para Birimi'),
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
