import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/auth_provider.dart';
import '../../model/user/user.dart';
import '../../model/user_view_model.dart';
import '../home/home_page.dart';
import '../setup/setup_page.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String routeName = '/splash';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<User>(userProvider, (previous, next) {
      if (next.firstSetup == false) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        Navigator.pushReplacementNamed(context, SetupPage.routeName);
      }
    });
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
