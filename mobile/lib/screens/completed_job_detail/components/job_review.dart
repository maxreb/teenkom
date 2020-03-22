import 'package:app/generated/client/jobs.pb.dart';
import 'package:flutter/material.dart';

class JobReview extends StatelessWidget {
  final BlitzjobRes job;

  const JobReview({Key key, this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Bewertung',
            style: Theme.of(context).textTheme.button,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text('${job.review}'),
        )
      ],
    );
  }
}
