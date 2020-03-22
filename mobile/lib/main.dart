import 'package:app/routes.dart';
import 'package:app/screens/jobs/jobs_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(TeenKom());

class TeenKom extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teenkom',
      routes: {
        '/': (_) => JobsScreen(),
      },
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
          primaryColor: Color(0xFF39922A), accentColor: Color(0xFFE46824)),
    );
  }
}
