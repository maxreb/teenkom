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
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Dein durchgeführter Blitzjob muss noch vom Kunden bewertet werden. '
            'Du kannst gerne mit dem Kunden Kontakt aufnehmen um dabei zu helfen.',
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlineButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'ANRUFEN',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () {},
            ),
          ),
        )
        //TODO
      ],
    );
  }
}
