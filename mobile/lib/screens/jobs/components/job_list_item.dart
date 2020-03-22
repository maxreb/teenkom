import 'package:animations/animations.dart';
import 'package:app/generated/client/jobs.pb.dart';
import 'package:app/models/job_types.dart';
import 'package:app/screens/completed_job_detail/completed_job_detail_screen.dart';
import 'package:app/screens/job_request/job_request_screen.dart';
import 'package:app/screens/open_job_detail/open_job_detail_screen.dart';
import 'package:flutter/material.dart';

class JobListItem extends StatelessWidget {
  final BlitzjobRes job;
  final JobTypes type;

  const JobListItem({Key key, @required this.job, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      closedColor: Theme.of(context).canvasColor,
      closedBuilder: (_, __) {
        return ListTile(
          title: Text('${job.title}'),
          subtitle: Text(job.descripton),
        );
      },
      openBuilder: (_, __) {
        if (type == JobTypes.request) {
          return JobRequestScreen(job: job);
        } else if (type == JobTypes.completed) {
          return CompletedJobDetailScreen(job: job);
        }
        return OpenJobDetailsScreen(job: job);
      },
    );
  }
}
