import 'package:app/arguments/job_request_argument.dart';
import 'package:app/models/job_types.dart';
import 'package:app/screens/jobs/components/job_list_item.dart';
import 'package:flutter/material.dart';

class JobsBody extends StatelessWidget {
  final JobTypes type;

  const JobsBody({Key key, @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) => JobListItem(
        index: index,
        onTap: () {
          if (type == JobTypes.completed) {
            //TODO
          } else if (type == JobTypes.request) {
            Navigator.of(context).pushNamed(
              '/job_request',
              arguments: JobRequestArgument('$index'),
            );
          } else if (type == JobTypes.open) {
            //TODO
          }
        },
      ),
    );
  }
}
