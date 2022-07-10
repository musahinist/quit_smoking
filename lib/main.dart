import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_smoking/view/branding/splash_page.dart';
import 'model/user/user.dart';
import 'model/user_view_model.dart';
import 'view/home/home_page.dart';
import 'view/setup/setup_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User user = ref.watch(userProvider);
    ref.read(userProvider.notifier).authStateChanged();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: user.firstSetup! ? SetupPage.routeName : HomePage.routeName,
      routes: Pages.routes,
    );
  }
}

class Pages {
  static final Map<String, Widget Function(BuildContext)> routes = {
    SplashPage.routeName: (context) => const SplashPage(),
    SetupPage.routeName: (context) => const SetupPage(),
    HomePage.routeName: (context) => const HomePage(),
  };
}
