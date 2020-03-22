import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

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
        ListTile(
          leading: Icon(Icons.timer),
          title: Text('2 Stunden Arbeitszeit'),
        ),
        ListTile(
          leading: Icon(Mdi.cashMultiple),
          title: Text('12 € verdient'),
        ),
      ],
    );
  }
}
