import 'package:app/components/job_details.dart';
import 'package:app/screens/open_job_detail/component/your_coach.dart';
import 'package:flutter/material.dart';

class OpenJobDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offener Blitzjob'),
      ),
      body: ListView(
        children: <Widget>[
          JobData(),
          SizedBox(height: 32),
          const YourCoach(),
        ],
      ),
    );
  }
}
