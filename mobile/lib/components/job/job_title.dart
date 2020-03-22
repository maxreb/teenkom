import 'package:app/generated/client/jobs.pb.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateFormat _startDateFormat = DateFormat('EEEE, dd. MMM HH:mm');

DateFormat _endDateFormat = DateFormat('HH:mm');

class JobTitle extends StatelessWidget {
  final bool showName;
  final BlitzjobRes job;

  const JobTitle({this.showName = false, this.job});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Text(
            '${job.title}${showName ? ' bei Frau Maier' : ''}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        //TODO
        ListTile(
          title: Text(
            '${_startDateFormat.format(job.startDate.toDateTime())} - ${_endDateFormat.format(job.endDate.toDateTime())}',
          ),
        ),
      ],
    );
  }
}
