import 'dart:io';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/utils/currency.dart';
import '../../core/utils/validator.dart';
import '../../core/widget/ui/form/date_form_field.dart';
import '../../model/user/user.dart';
import '../../model/user_view_model.dart';

//final _formKey = GlobalKey<FormState>();

class SetupPage extends ConsumerWidget {
  const SetupPage({Key? key}) : super(key: key);
  static const String routeName = '/setup';
  bool validate(User user) {
    bool valid = user.smokingYears != null &&
        user.smokingYears != 0 &&
        user.dailyCigaretteCount != null &&
        user.dailyCigaretteCount != 0 &&
        user.cigaretteAmountInPack != null &&
        user.cigaretteAmountInPack != 0 &&
        user.cigarettePriceInPack != null &&
        user.cigarettePriceInPack != 0;
    return valid;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User user = ref.watch(userProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            // key: _formKey,
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

                    /// validator: validate,
                    onChanged: (value) {
                      ref
                          .read(userProvider.notifier)
                          .updateUser(user.copyWith(quitDate: value));
                    }),
                const SizedBox(height: 12),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  // validator: validate,
                  decoration: const InputDecoration(
                    label: Text('How many years did you smoke?'),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    print(value);
                    ref.read(userProvider.notifier).updateUser(
                        user.copyWith(smokingYears: int.tryParse(value) ?? 0));
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  // validator: validate,
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
                  // validator: validate,
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
                  // validator: validate,
                  decoration: InputDecoration(
                    label: const Text('What is the price of the pack?'),
                    prefix: Text(user.currency ?? getCurrency()),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          showCurrencyPicker(
                            context: context,
                            showFlag: false,
                            theme: CurrencyPickerThemeData(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                            ),
                            showCurrencyName: true,
                            showCurrencyCode: true,
                            onSelect: (Currency currency) {
                              ref.read(userProvider.notifier).updateUser(
                                  user.copyWith(currency: currency.symbol));
                            },
                          );
                        },
                        icon: const Icon(Icons.currency_exchange_outlined)),
                  ),
                  onChanged: (value) {
                    ref.read(userProvider.notifier).updateUser(user.copyWith(
                        cigarettePriceInPack: double.tryParse(value) ?? 0));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: validate(user)
          ? FloatingActionButton(
              child: const Icon(Icons.check),
              onPressed: () {},
            )
          : null,
    );
  }
}
