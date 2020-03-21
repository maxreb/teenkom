import 'package:app/arguments/job_request_argument.dart';
import 'package:app/models/job_screen_types.dart';
import 'package:app/screens/jobs/components/job_list_item.dart';
import 'package:flutter/material.dart';

class JobsBody extends StatelessWidget {
  final JobScreenTypes type;

  const JobsBody({Key key, @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) => JobListItem(
        index: index,
        onTap: () {
          if (type == JobScreenTypes.completed) {
            //TODO
          } else if (type == JobScreenTypes.request) {
            Navigator.of(context).pushNamed(
              '/job_request',
              arguments: JobRequestArgument('$index'),
            );
          } else if (type == JobScreenTypes.open) {
            //TODO
          }
        },
      ),
    );
  }
}
