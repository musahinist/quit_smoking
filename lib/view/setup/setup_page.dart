import 'dart:io';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/widget/ui/form/date_form_field.dart';
import '../../model/user/user.dart';
import '../../model/user_view_model.dart';

class SetupPage extends ConsumerWidget {
  const SetupPage({Key? key}) : super(key: key);
  String getCurrency() {
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
    return format.currencySymbol;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User user = ref.watch(userProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            child: Column(
              children: [
                Text(
                  "Sigarayı bırakma kararınız için tebrikler!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 12),
                DateFormField(
                    label: 'When did you QUIT smoking?',
                    onChanged: (value) {
                      ref.read(userProvider.notifier).updateUser(
                          user.copyWith(quitDate: value.toIso8601String()));
                    }),
                const SizedBox(height: 12),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    label: Text('How many years did you smoke?'),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    ref.read(userProvider.notifier).updateUser(
                        user.copyWith(smokingYears: int.tryParse(value) ?? 0));
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    label: Text('How many cigarettes did you smoke per day?'),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    ref.read(userProvider.notifier).updateUser(user.copyWith(
                        dailyCigaretteCount: int.tryParse(value) ?? 0));
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    label: Text('How many cigarettes where in the pack?'),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    ref.read(userProvider.notifier).updateUser(user.copyWith(
                        cigaretteAmountInPack: int.tryParse(value) ?? 0));
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                  ],
                  decoration: InputDecoration(
                    label: const Text('What is the price of the pack?'),
                    prefix: Text(user.currency ?? getCurrency()),
                    border: const OutlineInputBorder(),
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
                    ref.read(userProvider.notifier).updateUser(user.copyWith(
                        cigarettePrice: int.tryParse(value) ?? 0));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {},
      ),
    );
  }
}
