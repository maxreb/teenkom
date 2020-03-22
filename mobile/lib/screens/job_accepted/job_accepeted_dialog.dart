import 'package:app/bloc/job_request_bloc.dart';
import 'package:app/generated/client/jobs.pb.dart';
import 'package:app/networking/response.dart';
import 'package:flutter/material.dart';

class JobAcceptedDialog extends StatelessWidget {
  final JobRequestBloc bloc;

  const JobAcceptedDialog({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final future = bloc.acceptJob();
    return AlertDialog(
      title: FutureBuilder<Response<AcceptJobRes>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.data.success) return Text('Blitzjob angenommen');
            return Text('Leider gab es einen Fehler beim Annehemen');
          }
          return Text('Lade...');
        },
      ),
      content: FutureBuilder<Response<AcceptJobRes>>(
        future: future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox(
              height: 36,
              width: 36,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 36, maxHeight: 36),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          if (!snapshot.data.data.success) return Container();
          //TODO:
          return Text(
            'Prima, wir werden Frau Maier Bescheid geben, dass du kommst. '
            'Es wird auch ein weitere Blitzjobber:in dabei sein.  wenn es noch Fragen gibt ist Coach Heinrich bis 12:00 heute erreichbar. '
            'Alle Informationen findest du auch bei deinen offenen Blitzjobs wieder',
          );
        },
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
