import 'package:flutter/material.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({Key key}) : super(key: key);

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> with SingleTickerProviderStateMixin {
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
          leading: Icon(Icons.terrain),
          title: Text('Tätigkeiten:  Rasen mähen, Laub harken'),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Karow Pankow, 45 Min. Fahrweg von zuhause'),
        ),
        ListTile(
          leading: Icon(Icons.euro_symbol),
          title: Text('6 €/Std. + 3 € Anfahrt'),
        ),
        ListTile(
          leading: Icon(Icons.event_note),
          title: Text(
            'CORONA: eigene Handschuhe mitbringen, min. 2 Meter Abstand zu Leute, nicht im Haus von Kunde reingehen, Gespräche',
          ),
        )
      ],
    );
  }
}
