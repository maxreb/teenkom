import 'package:flutter/material.dart';

class JobResults extends StatelessWidget {
  JobResults();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Resultate',
            style: Theme.of(context).textTheme.button,
          ),
        ),
        ListTile()
      ],
    );
  }
}
