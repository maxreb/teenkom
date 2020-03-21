import 'package:animations/animations.dart';
import 'package:app/arguments/job_request_argument.dart';
import 'package:app/models/job_types.dart';
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
        Widget item = JobListItem(
          index: index,
          onTap: type == JobTypes.request
              ? () {
                  Navigator.of(context).pushNamed(
                    '/job_request',
                    arguments: JobRequestArgument('$index'),
                  );
                }
              : null,
        );
        if (type != JobTypes.request) {
          return OpenContainer(
            closedBuilder: (_, __) => item,
            openBuilder: (_, __) {
              return OpenJobDetailsScreen();
            },
          );
        }
        return item;
      },
    );
  }
}
