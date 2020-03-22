import 'package:app/components/components.dart';
import 'package:flutter/material.dart';

class CompletedJobDetailScreen extends StatelessWidget {
  const CompletedJobDetailScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Erledigter Blitzjob'),
      ),
      body: ListView(
        children: <Widget>[
          JobTitle(),
          JobDetails(),
          SizedBox(height: 32),
          JobResults(),
        ],
      ),
    );
  }
}
