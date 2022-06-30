import 'package:flutter/material.dart';
import 'package:quit_smoking/core/widget/ui/form/date_form_field.dart';
import 'package:quit_smoking/model/user/mock_user.dart';

class SmokerInfoSection extends StatelessWidget {
  const SmokerInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                mockUser = mockUser.copyWith(quitDate: value.toIso8601String());
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
