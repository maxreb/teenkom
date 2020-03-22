import 'package:flutter/material.dart';

class JobAcceptedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Blitzjob angenommen'),
      content: Text(
        'Prima, wir werden <Kunde Name> Bescheid geben, dass du kommst. '
        'Es wird auch ein weitere Blitzjobber:in dabei sein.  wenn es noch Fragen gibt ist Coach  <Name> bis <Uhrzeit> heute erreichbar. '
        'Alle Informationen findest du auch bei deinen offenen Blitzjobs wieder',
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text('COACH KONTAKTIEREN'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).popUntil(
              (route) => route.settings.name == '/',
            );
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
