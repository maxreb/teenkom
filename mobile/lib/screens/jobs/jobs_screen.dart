import 'package:app/models/job_types.dart';
import 'package:app/screens/jobs/components/jobs_body.dart';
import 'package:app/screens/settings_bottom_sheet/settings_bottom_sheet.dart';
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
          actions: <Widget>[
            Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => SettingsBottomSheet(),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            JobsBody(type: JobTypes.completed),
            JobsBody(type: JobTypes.request),
            JobsBody(type: JobTypes.open),
          ],
        ),
      ),
    );
  }
}
