import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_smoking/view/branding/splash_page.dart';
import 'view/home/home_page.dart';
import 'view/setup/setup_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: SetupPage.routeName,
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
