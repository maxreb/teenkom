import 'package:app/bloc/jobs_bloc.dart';
import 'package:app/models/job_types.dart';
import 'package:app/screens/jobs/components/jobs_body.dart';
import 'package:app/screens/settings_bottom_sheet/settings_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobsScreen extends StatelessWidget {
  final int initialIndex;

  const JobsScreen({this.initialIndex = 0}) : assert(initialIndex != null);

  @override
  Widget build(BuildContext context) {
    return Provider<JobsBloc>(
      create: (_) => JobsBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: DefaultTabController(
        initialIndex: initialIndex,
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Blitzjobs'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Erledigte'),
                Tab(text: 'Anfragen'),
                Tab(text: 'Offene'),
              ],
            ),
            actions: <Widget>[
              Builder(
                builder: (context) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/blitzjobber.png',
                        width: 45,
                        height: 45,
                      ),
                    ),
                    onTap: () {
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
      ),
    );
  }
}
