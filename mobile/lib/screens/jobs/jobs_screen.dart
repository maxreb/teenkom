import 'package:app/models/job_screen_types.dart';
import 'package:app/screens/jobs/components/jobs_body.dart';
import 'package:flutter/material.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Blitzjobs'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Abgeschlossene'),
              Tab(text: 'Anfragen'),
              Tab(text: 'Offene'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            JobsBody(type: JobScreenTypes.completed),
            JobsBody(type: JobScreenTypes.request),
            JobsBody(type: JobScreenTypes.open),
          ],
        ),
      ),
    );
  }
}
