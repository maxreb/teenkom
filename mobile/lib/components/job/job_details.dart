import 'package:app/generated/client/jobs.pbgrpc.dart';
import 'package:flutter/material.dart';

class JobDetails extends StatefulWidget {
  final BlitzjobRes job;

  const JobDetails({Key key, @required this.job}) : super(key: key);

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Details',
            style: Theme.of(context).textTheme.button,
          ),
        ),
        ListTile(
          leading: Icon(Icons.assignment),
          title: Text('${widget.job.descripton}'),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('${widget.job.location}'),
        ),
        ListTile(
          leading: Icon(Icons.euro_symbol),
          title: Text('${widget.job.hourlyRate.roundToDouble()} €'),
        ),
        ListTile(
          leading: Icon(Icons.note),
          title: Text('${widget.job.note}'),
        )
      ],
    );
  }
}
