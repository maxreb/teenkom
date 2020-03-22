import 'package:app/components/job/components.dart';
import 'package:app/screens/open_job_detail/components/job_awaiting_review.dart';
import 'package:flutter/material.dart';

class OpenJobDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offener Blitzjob'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 16),
        children: <Widget>[
          JobTitle(showName: true),
          const SizedBox(height: 16),
          const JobDetails(),
          const SizedBox(height: 32),
          const JobCoach(),
          const SizedBox(height: 32),
          const JobAwaitingReview(),
        ],
      ),
    );
  }
}
