import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:e_pay/routes.dart';
import 'package:e_pay/screens/profile/profile_screen.dart';
import 'package:e_pay/screens/splash/splash_screen.dart';
import 'package:e_pay/theme.dart';

import 'routes.dart';
import 'screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(MyApp());

  //MaterialApp(
  //initialRoute: SplashScreen.routeName,
  //routes: routes,
  //));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
