import 'package:app/routes.dart';
import 'package:app/screens/navigation/navigation_screen.dart';
import 'package:app/utils/firebase.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initFirebaseMessaging();
    return MaterialApp(
      title: 'Teenkom',
      routes: {
        '/': (_) => NavigationScreen(),
      },
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        primaryColor: Color(0xFF39922A),
        accentColor: Color(0xFFE46824)
      ),
    );
  }
}
