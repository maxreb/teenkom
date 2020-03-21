import 'package:app/networking/api_provider.dart';
import 'package:app/routes.dart';
import 'package:app/screens/navigation/navigation_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ApiProvider();
    return MaterialApp(
      title: 'Teenkom',
      routes: {
        '/': (_) => NavigationScreen(),
      },
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
