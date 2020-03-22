import 'package:app/components/job/components.dart';
import 'package:app/generated/client/jobs.pb.dart';
import 'package:app/screens/completed_job_detail/components/job_review.dart';
import 'package:flutter/material.dart';

class CompletedJobDetailScreen extends StatelessWidget {
  final BlitzjobRes job;

  const CompletedJobDetailScreen({@required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Erledigter Blitzjob'),
      ),
      body: ListView(
        children: <Widget>[
          JobTitle(showName: true, job: job),
          JobDetails(job: job),
          SizedBox(height: 32),
          JobResults(),
          SizedBox(height: 32),
          JobReview(job: job),
        ],
      ),
    );
  }
}
