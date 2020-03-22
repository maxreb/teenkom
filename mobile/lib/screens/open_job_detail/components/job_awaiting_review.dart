import 'package:flutter/material.dart';

class JobAwaitingReview extends StatelessWidget {
  const JobAwaitingReview();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Ausstehende Bewertung',
            style: Theme.of(context).textTheme.button,
          ),
        ),
        //TODO
      ],
    );
  }
}
