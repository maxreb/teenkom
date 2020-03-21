import 'package:flutter/material.dart';

class YourCoach extends StatelessWidget {
  const YourCoach();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Dein Coach',
            style: Theme.of(context).textTheme.button,
          ),
        ),
        ListTile(
          leading: Image.asset(
            'images/coach.png',
            width: 50,
            height: 50,
          ),
          title: Text('Erika Musterfrau'),
          subtitle: Text('erreichbar von 12:00 bis 16:00'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              OutlineButton(
                onPressed: () {},
                child: Text(
                  'TEXT',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              OutlineButton(
                onPressed: () {},
                child: Text(
                  'ANRUFEN',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
