import 'package:flutter/material.dart';
import 'package:quit_smoking/core/widget/ui/form/date_form_field.dart';

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
                print(value);
              }),
          TextFormField(
            initialValue: "20",
            decoration: InputDecoration(label: Text('Siagra içilen yıl')),
          ),
          TextFormField(
            initialValue: "20",
            decoration: InputDecoration(label: Text('Günlük içilen sigara')),
          ),
          TextFormField(
            initialValue: "25",
            decoration:
                InputDecoration(label: Text('Günlük içilen sigara fiyatı')),
          ),
          TextFormField(
            initialValue: "TRY",
            decoration: InputDecoration(label: Text('Para Birimi')),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {},
      ),
    );
  }
}
