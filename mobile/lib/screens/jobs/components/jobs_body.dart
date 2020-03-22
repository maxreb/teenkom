import 'package:animations/animations.dart';
import 'package:app/models/job_types.dart';
import 'package:app/screens/completed_job_detail/completed_job_detail_screen.dart';
import 'package:app/screens/job_request/job_request_screen.dart';
import 'package:app/screens/jobs/components/job_list_item.dart';
import 'package:app/screens/open_job_detail/open_job_detail_screen.dart';
import 'package:flutter/material.dart';

class JobsBody extends StatelessWidget {
  final JobTypes type;

  const JobsBody({Key key, @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return OpenContainer(
          closedElevation: 0,
          closedColor: Theme.of(context).canvasColor,
          closedBuilder: (_, __) {
            return JobListItem(
              index: index,
              onTap: null,
            );
          },
          openBuilder: (_, __) {
            if (type == JobTypes.request) {
              return JobRequestScreen(id: '$index');
            } else if (type == JobTypes.completed) {
              return CompletedJobDetailScreen();
            }
            return OpenJobDetailsScreen();
          },
        );
      },
      itemCount: 10,
    );
  }
}
