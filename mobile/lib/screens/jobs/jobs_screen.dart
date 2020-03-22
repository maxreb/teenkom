import 'package:app/arguments/job_request_argument.dart';
import 'package:app/bloc/jobs_bloc.dart';
import 'package:app/models/job_types.dart';
import 'package:app/screens/jobs/components/jobs_body.dart';
import 'package:app/screens/open_job_detail/open_job_detail_screen.dart';
import 'package:app/screens/settings_bottom_sheet/settings_bottom_sheet.dart';
import 'package:app/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen();

  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    initFirebaseMessaging(
      (id) async {
        tabController.index = 1;
        await Future.delayed(Duration.zero);
        Navigator.pushNamed(
          context,
          '/job_request',
          arguments: JobRequestArgument(id),
        );
      },
      (id) async {
        tabController.index = 2;
        await Future.delayed(Duration.zero);
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => OpenJobDetailsScreen(id: id),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<JobsBloc>(
      create: (_) => JobsBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Blitzjobs'),
          bottom: TabBar(
            controller: tabController,
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
          controller: tabController,
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
