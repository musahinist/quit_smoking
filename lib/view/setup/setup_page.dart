import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widget/ui/form/date_form_field.dart';
import '../../model/user/mock_user.dart';
import 'package:currency_picker/currency_picker.dart';

import '../../model/user/user.dart';
import '../../model/user_view_model.dart';

class SetupPage extends ConsumerStatefulWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  SetupPageState createState() => SetupPageState();
}

class SetupPageState extends ConsumerState<SetupPage> {
  @override
  Widget build(BuildContext context) {
    User user = ref.watch(userProvider);
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
              label: 'When did you start smoking?',
              onChanged: (value) {
                ref.read(userProvider.notifier).updateUser(
                    user.copyWith(quitDate: value.toIso8601String()));
              }),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('How many years did you smoke?'),
            ),
            onChanged: (value) {
              ref
                  .read(userProvider.notifier)
                  .updateUser(user.copyWith(smokingYears: int.tryParse(value)));
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('How many cigarettes did you smoke per day?'),
            ),
            onChanged: (value) {
              ref.read(userProvider.notifier).updateUser(
                  user.copyWith(dailyCigaretteCount: int.tryParse(value)));
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('How many cigarettes where in the pack?'),
            ),
            onChanged: (value) {
              ref.read(userProvider.notifier).updateUser(
                  user.copyWith(cigaretteAmountInPack: int.tryParse(value)));
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: const Text('What is the price of the pack?'),
              suffixIcon: IconButton(
                  onPressed: () {
                    showCurrencyPicker(
                      context: context,
                      showFlag: false,
                      showCurrencyName: true,
                      showCurrencyCode: true,
                      onSelect: (Currency currency) {
                        print('Select currency: ${currency.symbol}');
                        ref.read(userProvider.notifier).updateUser(
                            user.copyWith(currency: currency.symbol));
                      },
                    );
                  },
                  icon: const Icon(Icons.currency_exchange_outlined)),
            ),
            onChanged: (value) {
              ref.read(userProvider.notifier).updateUser(
                  user.copyWith(cigarettePrice: int.tryParse(value)));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {},
      ),
    );
  }
}
