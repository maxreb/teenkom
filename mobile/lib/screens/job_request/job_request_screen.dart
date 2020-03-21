import 'package:app/screens/job_request/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobRequestScreen extends StatefulWidget {
  final String id;

  const JobRequestScreen({Key key, this.id}) : super(key: key);

  @override
  _JobRequestScreenState createState() => _JobRequestScreenState();
}

class _JobRequestScreenState extends State<JobRequestScreen> {
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anfrage für eine Blitzjob'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text(
              'Gartenarbeit',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          ListTile(
            title: Text('Samstag 28. März. 10 - 13 Uhr'),
          ),
          if (_showDetails) ...[
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
          Expanded(
            child: ButtonRow(
              stageOneCompleted: _showDetails,
              onContinue: () {
                setState(() => _showDetails = true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
